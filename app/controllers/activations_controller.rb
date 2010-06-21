class ActivationsController < ApplicationController

  def new
    @activation = Activation.new
  end
  
  def create
    @activation = Activation.new(params[:activation])
    
    if @activation.invalid? and @activation.errors.on(:email) == Activation::EMAIL_TAKEN_MSG
      @activation = Activation.find_by_email(params[:activation][:email]) 
      ActivationMailer.deliver_activation(@activation)  #s end activation email again
    end

    if @activation.save
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
      redirect_to :root     
    else
      flash[:notice] = "Sorry, something went wrong.  Please try again."
      render :action => 'new'
    end
  end
  

end
