class User < ActiveRecord::Base
  acts_as_authentic
  #attr_accessible :first_name, :last_name, :email #TODO REVIEW THIS 
  has_many :jobs, :dependent => :destroy
  validates_associated :jobs 
  validate :limit_jobs

  after_update :save_jobs
  
  def new_job_attributes=(job_attributes)
    job_attributes.each do |attributes|
      jobs.build(attributes)
    end
  end
  
  def update_job_attributes=(job_attributes)
    jobs.reject(&:new_record?).each do |job|
      attributes = job_attributes[job.id.to_s]
      if attributes
        job.attributes = attributes
      else 
        jobs.delete(job)
      end
    end
  end

  def save_jobs
    jobs.each do |job|
      job.save(false) # handle validation when user is saved
    end
  end
  
  private
  
  def limit_jobs
    limit = 7
    errors.add_to_base("too many past jobs! limit is #{limit} jobs") if jobs.size > 7
  end
  
end
