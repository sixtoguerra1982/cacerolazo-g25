require 'test_helper'

class EventoAdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evento_admins_index_url
    assert_response :success
  end

end
