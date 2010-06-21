class Job < ActiveRecord::Base
  #attr_accessible :title, :company  
  belongs_to :user
  validates_presence_of :title, :company  
  

  
end
