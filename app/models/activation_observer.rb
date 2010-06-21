class ActivationObserver < ActiveRecord::Observer
  
  # First time 
  def after_create(activation)
    ActivationMailer.deliver_activation(activation)
  end
  
end
