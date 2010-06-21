module UsersHelper
  
  def initialize_boolean(*arr)
    arr.inject({}) {|result,element| result[element] = true; result}
  end
  
  def add_job_link(name)
    link_to_function name do |page| 
      page.insert_html :bottom, :jobs, :partial => 'job', :object => Job.new 
    end
  end
  
  def fields_for_job(job, &block)
    prefix = job.new_record? ? 'new' : 'update' 
    fields_for("user[#{prefix}_job_attributes][]", job, &block)
  end 
  
end
