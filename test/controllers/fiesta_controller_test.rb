require 'test_helper'

class FiestaControllerTest < ActionController::TestCase
  setup do
    @fiestum = fiesta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fiesta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fiestum" do
    assert_difference('Fiestum.count') do
      post :create, fiestum: { fecha: @fiestum.fecha, id_cliente: @fiestum.id_cliente, id_empleado: @fiestum.id_empleado, id_fiesta: @fiestum.id_fiesta, id_paquete: @fiestum.id_paquete }
    end

    assert_redirected_to fiestum_path(assigns(:fiestum))
  end

  test "should show fiestum" do
    get :show, id: @fiestum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fiestum
    assert_response :success
  end

  test "should update fiestum" do
    patch :update, id: @fiestum, fiestum: { fecha: @fiestum.fecha, id_cliente: @fiestum.id_cliente, id_empleado: @fiestum.id_empleado, id_fiesta: @fiestum.id_fiesta, id_paquete: @fiestum.id_paquete }
    assert_redirected_to fiestum_path(assigns(:fiestum))
  end

  test "should destroy fiestum" do
    assert_difference('Fiestum.count', -1) do
      delete :destroy, id: @fiestum
    end

    assert_redirected_to fiesta_path
  end
end
