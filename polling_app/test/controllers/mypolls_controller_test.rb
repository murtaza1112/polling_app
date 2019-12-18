require 'test_helper'

class MypollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mypoll = mypolls(:one)
  end

  test "should get index" do
    get mypolls_url
    assert_response :success
  end

  test "should get new" do
    get new_mypoll_url
    assert_response :success
  end

  test "should create mypoll" do
    assert_difference('Mypoll.count') do
      post mypolls_url, params: { mypoll: { category_id: @mypoll.category_id, user_id: @mypoll.user_id } }
    end

    assert_redirected_to mypoll_url(Mypoll.last)
  end

  test "should show mypoll" do
    get mypoll_url(@mypoll)
    assert_response :success
  end

  test "should get edit" do
    get edit_mypoll_url(@mypoll)
    assert_response :success
  end

  test "should update mypoll" do
    patch mypoll_url(@mypoll), params: { mypoll: { category_id: @mypoll.category_id, user_id: @mypoll.user_id } }
    assert_redirected_to mypoll_url(@mypoll)
  end

  test "should destroy mypoll" do
    assert_difference('Mypoll.count', -1) do
      delete mypoll_url(@mypoll)
    end

    assert_redirected_to mypolls_url
  end
end
