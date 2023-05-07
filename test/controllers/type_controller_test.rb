require "test_helper"

class TypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get type_index_url
    assert_response :success
  end

  test "should get edit" do
    get type_edit_url
    assert_response :success
  end
end
