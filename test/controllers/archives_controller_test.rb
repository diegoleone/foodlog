require 'test_helper'

class ArchivesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get archives_index_url
    assert_response :success
  end

end
