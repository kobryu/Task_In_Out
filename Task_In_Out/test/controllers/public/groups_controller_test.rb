require "test_helper"

class Public::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_groups_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_groups_edit_url
    assert_response :success
  end
end
