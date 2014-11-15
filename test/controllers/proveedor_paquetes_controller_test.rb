require 'test_helper'

class ProveedorPaquetesControllerTest < ActionController::TestCase
  setup do
    @proveedor_paquete = proveedor_paquetes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proveedor_paquetes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proveedor_paquete" do
    assert_difference('ProveedorPaquete.count') do
      post :create, proveedor_paquete: { id_paquete: @proveedor_paquete.id_paquete, id_provedor: @proveedor_paquete.id_provedor }
    end

    assert_redirected_to proveedor_paquete_path(assigns(:proveedor_paquete))
  end

  test "should show proveedor_paquete" do
    get :show, id: @proveedor_paquete
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proveedor_paquete
    assert_response :success
  end

  test "should update proveedor_paquete" do
    patch :update, id: @proveedor_paquete, proveedor_paquete: { id_paquete: @proveedor_paquete.id_paquete, id_provedor: @proveedor_paquete.id_provedor }
    assert_redirected_to proveedor_paquete_path(assigns(:proveedor_paquete))
  end

  test "should destroy proveedor_paquete" do
    assert_difference('ProveedorPaquete.count', -1) do
      delete :destroy, id: @proveedor_paquete
    end

    assert_redirected_to proveedor_paquetes_path
  end
end
