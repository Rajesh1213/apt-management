require 'test_helper'

class TenantAutosControllerTest < ActionController::TestCase
  setup do
    @tenant_auto = tenant_autos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenant_autos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant_auto" do
    assert_difference('TenantAuto.count') do
      post :create, tenant_auto: { auto_color: @tenant_auto.auto_color, auto_make: @tenant_auto.auto_make, auto_model: @tenant_auto.auto_model, auto_year: @tenant_auto.auto_year, license_number: @tenant_auto.license_number }
    end

    assert_redirected_to tenant_auto_path(assigns(:tenant_auto))
  end

  test "should show tenant_auto" do
    get :show, id: @tenant_auto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant_auto
    assert_response :success
  end

  test "should update tenant_auto" do
    patch :update, id: @tenant_auto, tenant_auto: { auto_color: @tenant_auto.auto_color, auto_make: @tenant_auto.auto_make, auto_model: @tenant_auto.auto_model, auto_year: @tenant_auto.auto_year, license_number: @tenant_auto.license_number }
    assert_redirected_to tenant_auto_path(assigns(:tenant_auto))
  end

  test "should destroy tenant_auto" do
    assert_difference('TenantAuto.count', -1) do
      delete :destroy, id: @tenant_auto
    end

    assert_redirected_to tenant_autos_path
  end
end
