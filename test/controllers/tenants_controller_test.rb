require 'test_helper'

class TenantsControllerTest < ActionController::TestCase
  setup do
    @tenant = tenants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant" do
    assert_difference('Tenant.count') do
      post :create, tenant: { dob: @tenant.dob, employer: @tenant.employer, first_name: @tenant.first_name, gender: @tenant.gender, home_phone: @tenant.home_phone, last_name: @tenant.last_name, marital_status: @tenant.marital_status, password: @tenant.password, username: @tenant.username, work_phone: @tenant.work_phone }
    end

    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should show tenant" do
    get :show, id: @tenant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant
    assert_response :success
  end

  test "should update tenant" do
    patch :update, id: @tenant, tenant: { dob: @tenant.dob, employer: @tenant.employer, first_name: @tenant.first_name, gender: @tenant.gender, home_phone: @tenant.home_phone, last_name: @tenant.last_name, marital_status: @tenant.marital_status, password: @tenant.password, username: @tenant.username, work_phone: @tenant.work_phone }
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should destroy tenant" do
    assert_difference('Tenant.count', -1) do
      delete :destroy, id: @tenant
    end

    assert_redirected_to tenants_path
  end
end
