require 'test_helper'

class ItinerariostrutturasControllerTest < ActionController::TestCase
  setup do
    @itinerariostruttura = itinerariostrutturas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerariostrutturas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerariostruttura" do
    assert_difference('Itinerariostruttura.count') do
      post :create, itinerariostruttura: { creator_id: @itinerariostruttura.creator_id, itinerario_id: @itinerariostruttura.itinerario_id, struttura_id: @itinerariostruttura.struttura_id }
    end

    assert_redirected_to itinerariostruttura_path(assigns(:itinerariostruttura))
  end

  test "should show itinerariostruttura" do
    get :show, id: @itinerariostruttura
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerariostruttura
    assert_response :success
  end

  test "should update itinerariostruttura" do
    put :update, id: @itinerariostruttura, itinerariostruttura: { creator_id: @itinerariostruttura.creator_id, itinerario_id: @itinerariostruttura.itinerario_id, struttura_id: @itinerariostruttura.struttura_id }
    assert_redirected_to itinerariostruttura_path(assigns(:itinerariostruttura))
  end

  test "should destroy itinerariostruttura" do
    assert_difference('Itinerariostruttura.count', -1) do
      delete :destroy, id: @itinerariostruttura
    end

    assert_redirected_to itinerariostrutturas_path
  end
end
