require 'test_helper'

class LinkCollectionsControllerTest < ActionController::TestCase
  setup do
    @link_collection = link_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_collection" do
    assert_difference('LinkCollection.count') do
      post :create, :link_collection => @link_collection.attributes
    end

    assert_redirected_to link_collection_path(assigns(:link_collection))
  end

  test "should show link_collection" do
    get :show, :id => @link_collection.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @link_collection.to_param
    assert_response :success
  end

  test "should update link_collection" do
    put :update, :id => @link_collection.to_param, :link_collection => @link_collection.attributes
    assert_redirected_to link_collection_path(assigns(:link_collection))
  end

  test "should destroy link_collection" do
    assert_difference('LinkCollection.count', -1) do
      delete :destroy, :id => @link_collection.to_param
    end

    assert_redirected_to link_collections_path
  end
end
