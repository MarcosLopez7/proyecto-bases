require 'test_helper'

class EmpleadoClientesControllerTest < ActionController::TestCase
  setup do
    @empleado_cliente = empleado_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empleado_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empleado_cliente" do
    assert_difference('EmpleadoCliente.count') do
      post :create, empleado_cliente: { fecha: @empleado_cliente.fecha, hora: @empleado_cliente.hora, id_cliente: @empleado_cliente.id_cliente, id_empleado: @empleado_cliente.id_empleado }
    end

    assert_redirected_to empleado_cliente_path(assigns(:empleado_cliente))
  end

  test "should show empleado_cliente" do
    get :show, id: @empleado_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empleado_cliente
    assert_response :success
  end

  test "should update empleado_cliente" do
    patch :update, id: @empleado_cliente, empleado_cliente: { fecha: @empleado_cliente.fecha, hora: @empleado_cliente.hora, id_cliente: @empleado_cliente.id_cliente, id_empleado: @empleado_cliente.id_empleado }
    assert_redirected_to empleado_cliente_path(assigns(:empleado_cliente))
  end

  test "should destroy empleado_cliente" do
    assert_difference('EmpleadoCliente.count', -1) do
      delete :destroy, id: @empleado_cliente
    end

    assert_redirected_to empleado_clientes_path
  end
end
