require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  def test_should_not_be_valid_without_name 
    s = Story.create(:name => nil, :link => 'http://www.testsubmission.com/') 
    assert s.errors.on(:name)
  end
  def test_should_be_valid_without_link
     s = Story.create(:name => 'My test submission', :link => nil) 
     assert s.errors.on(:link)
  end
  def test_should_create_story
  s = Story.create(:name => 'My test submission',:link => 'http://www.testsubmission.com/') 
  assert  s.valid?
  end

end
