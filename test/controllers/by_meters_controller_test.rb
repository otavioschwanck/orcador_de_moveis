require 'test_helper'

class ByMetersControllerTest < ActionController::TestCase
  setup do
    @by_meter = by_meters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:by_meters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create by_meter" do
    assert_difference('ByMeter.count') do
      post :create, by_meter: { height: @by_meter.height, meter_price: @by_meter.meter_price, mobile_id: @by_meter.mobile_id, qtd: @by_meter.qtd, width: @by_meter.width }
    end

    assert_redirected_to by_meter_path(assigns(:by_meter))
  end

  test "should show by_meter" do
    get :show, id: @by_meter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @by_meter
    assert_response :success
  end

  test "should update by_meter" do
    patch :update, id: @by_meter, by_meter: { height: @by_meter.height, meter_price: @by_meter.meter_price, mobile_id: @by_meter.mobile_id, qtd: @by_meter.qtd, width: @by_meter.width }
    assert_redirected_to by_meter_path(assigns(:by_meter))
  end

  test "should destroy by_meter" do
    assert_difference('ByMeter.count', -1) do
      delete :destroy, id: @by_meter
    end

    assert_redirected_to by_meters_path
  end
end
