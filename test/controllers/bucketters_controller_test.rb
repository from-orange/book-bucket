require 'test_helper'

class BuckettersControllerTest < ActionController::TestCase
  setup do
    @bucketter = bucketters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bucketters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bucketter" do
    assert_difference('Bucketter.count') do
      post :create, bucketter: {  }
    end

    assert_redirected_to bucketter_path(assigns(:bucketter))
  end

  test "should show bucketter" do
    get :show, id: @bucketter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bucketter
    assert_response :success
  end

  test "should update bucketter" do
    patch :update, id: @bucketter, bucketter: {  }
    assert_redirected_to bucketter_path(assigns(:bucketter))
  end

  test "should destroy bucketter" do
    assert_difference('Bucketter.count', -1) do
      delete :destroy, id: @bucketter
    end

    assert_redirected_to bucketters_path
  end
end
