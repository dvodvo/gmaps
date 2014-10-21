require 'test_helper'

class OverlaysControllerTest < ActionController::TestCase
  setup do
    @overlay = overlays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overlays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create overlay" do
    assert_difference('Overlay.count') do
      post :create, overlay: { content: @overlay.content, fillColor: @overlay.fillColor, fillOpacity: @overlay.fillOpacity, strokeColor: @overlay.strokeColor, strokeOpacity: @overlay.strokeOpacity, strokeWeight: @overlay.strokeWeight, title: @overlay.title, type: @overlay.type }
    end

    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should show overlay" do
    get :show, id: @overlay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @overlay
    assert_response :success
  end

  test "should update overlay" do
    put :update, id: @overlay, overlay: { content: @overlay.content, fillColor: @overlay.fillColor, fillOpacity: @overlay.fillOpacity, strokeColor: @overlay.strokeColor, strokeOpacity: @overlay.strokeOpacity, strokeWeight: @overlay.strokeWeight, title: @overlay.title, type: @overlay.type }
    assert_redirected_to overlay_path(assigns(:overlay))
  end

  test "should destroy overlay" do
    assert_difference('Overlay.count', -1) do
      delete :destroy, id: @overlay
    end

    assert_redirected_to overlays_path
  end
end
