class UsersController < ApplicationController
  
  
  def new
    redirect_to new_activation_url and return unless params[:activation_code]
    session[:activation_code] = params[:activation_code]
    @user = User.new
    flash[:notice] = "Welcome back!"
  end
  
  def create
    @user = User.new(params[:user])
    activation = Activation.find_by_activation_code(session[:activation_code])
    
    if activation
      @user.email = activation.email 
    else 
      flash[:notice] = "Please verify your email address before signing up."
      redirect_to register_url and return
    end
    
    if @user.save
      activation.destroy # user created no longer need activation email
      flash[:notice] = "Successfully registered your account."
      redirect_to edit_user_url(@user, :complete => true) and return 
    else
      render :action => 'new'
    end
  end
  
  
  def edit
    @complete_state = params[:complete]
    @user = current_user
  end
  
  def update
    params[:user][:update_job_attributes] ||= {}
    @user = current_user
        
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated your info."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  
end
