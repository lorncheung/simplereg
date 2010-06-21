require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def test_should_be_valid  
    assert Job.new(:title => "Developer", :company => "FakeCo").valid?
  end
  
  def test_should_be_invalid
    assert Job.new.invalid?
  end
end
