class ActivationMailer < ActionMailer::Base
  def activation(activation)
    setup_email(activation)
    @subject    += 'Please activate your new account'
    @body[:url] = "http://localhost:3000/activate/#{activation.activation_code}"
  end
  
  protected
  
  def setup_email(activation)
    @recipients  = "#{activation.email}"
    @from        = "do-not-reply@localhost.com"
    @subject     = "[SimpleReg] "
    @sent_on     = Time.now
  end
end

