require 'test_helper'

class PaqueteInventariosControllerTest < ActionController::TestCase
  setup do
    @paquete_inventario = paquete_inventarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paquete_inventarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paquete_inventario" do
    assert_difference('PaqueteInventario.count') do
      post :create, paquete_inventario: { id_inventario: @paquete_inventario.id_inventario, id_paquete: @paquete_inventario.id_paquete }
    end

    assert_redirected_to paquete_inventario_path(assigns(:paquete_inventario))
  end

  test "should show paquete_inventario" do
    get :show, id: @paquete_inventario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paquete_inventario
    assert_response :success
  end

  test "should update paquete_inventario" do
    patch :update, id: @paquete_inventario, paquete_inventario: { id_inventario: @paquete_inventario.id_inventario, id_paquete: @paquete_inventario.id_paquete }
    assert_redirected_to paquete_inventario_path(assigns(:paquete_inventario))
  end

  test "should destroy paquete_inventario" do
    assert_difference('PaqueteInventario.count', -1) do
      delete :destroy, id: @paquete_inventario
    end

    assert_redirected_to paquete_inventarios_path
  end
end
