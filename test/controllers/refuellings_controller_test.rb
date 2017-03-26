require 'test_helper'

class RefuellingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get refuellings_new_url
    assert_response :success
  end

  test "should get create" do
    get refuellings_create_url
    assert_response :success
  end

  test "should get update" do
    get refuellings_update_url
    assert_response :success
  end

  test "should get edit" do
    get refuellings_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get refuellings_destroy_url
    assert_response :success
  end

  test "should get index" do
    get refuellings_index_url
    assert_response :success
  end

  test "should get show" do
    get refuellings_show_url
    assert_response :success
  end

end
