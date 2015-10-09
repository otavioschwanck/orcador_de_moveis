require 'test_helper'

class UnregistredItemsControllerTest < ActionController::TestCase
  setup do
    @unregistred_item = unregistred_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unregistred_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unregistred_item" do
    assert_difference('UnregistredItem.count') do
      post :create, unregistred_item: { description: @unregistred_item.description, mobile_id: @unregistred_item.mobile_id, qtd: @unregistred_item.qtd, value: @unregistred_item.value }
    end

    assert_redirected_to unregistred_item_path(assigns(:unregistred_item))
  end

  test "should show unregistred_item" do
    get :show, id: @unregistred_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unregistred_item
    assert_response :success
  end

  test "should update unregistred_item" do
    patch :update, id: @unregistred_item, unregistred_item: { description: @unregistred_item.description, mobile_id: @unregistred_item.mobile_id, qtd: @unregistred_item.qtd, value: @unregistred_item.value }
    assert_redirected_to unregistred_item_path(assigns(:unregistred_item))
  end

  test "should destroy unregistred_item" do
    assert_difference('UnregistredItem.count', -1) do
      delete :destroy, id: @unregistred_item
    end

    assert_redirected_to unregistred_items_path
  end
end
