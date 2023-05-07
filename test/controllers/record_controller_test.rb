require "test_helper"

class RecordControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get record_new_url
    assert_response :success
  end

  test "should get index" do
    get record_index_url
    assert_response :success
  end

  test "should get show" do
    get record_show_url
    assert_response :success
  end

  test "should get edit" do
    get record_edit_url
    assert_response :success
  end
end
