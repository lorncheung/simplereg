class Activation < ActiveRecord::Base
  attr_accessible :email, :activation_code
  
  EMAIL_TAKEN_MSG = "email has already been entered."
  
  validates_length_of       :email, :within => 6..100, :message => "email is too short."
  validates_uniqueness_of   :email, :message => EMAIL_TAKEN_MSG
  #validates_format_of       :email, :with =>  %r{\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z}, :case_sensitive => false, :message => "should look like an email address."
  validates_format_of       :email,   :with => %r{\A.+@+.+\Z}
  
  before_create :make_activation_code 
    
  
  def make_activation_code
    self.activation_code = make_token
  end
  
  protected 
  
  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
  
  def make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end 

end

