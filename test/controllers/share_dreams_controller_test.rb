require 'test_helper'

class ShareDreamsControllerTest < ActionController::TestCase
  setup do
    @share_dream = share_dreams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_dreams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_dream" do
    assert_difference('ShareDream.count') do
      post :create, share_dream: { description: @share_dream.description, tittle: @share_dream.tittle }
    end

    assert_redirected_to share_dream_path(assigns(:share_dream))
  end

  test "should show share_dream" do
    get :show, id: @share_dream
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @share_dream
    assert_response :success
  end

  test "should update share_dream" do
    patch :update, id: @share_dream, share_dream: { description: @share_dream.description, tittle: @share_dream.tittle }
    assert_redirected_to share_dream_path(assigns(:share_dream))
  end

  test "should destroy share_dream" do
    assert_difference('ShareDream.count', -1) do
      delete :destroy, id: @share_dream
    end

    assert_redirected_to share_dreams_path
  end
end
