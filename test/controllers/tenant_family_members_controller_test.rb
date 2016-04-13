require 'test_helper'

class TenantFamilyMembersControllerTest < ActionController::TestCase
  setup do
    @tenant_family_member = tenant_family_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenant_family_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant_family_member" do
    assert_difference('TenantFamilyMember.count') do
      post :create, tenant_family_member: { dob: @tenant_family_member.dob, gender: @tenant_family_member.gender, marital_status: @tenant_family_member.marital_status, member_type: @tenant_family_member.member_type, name: @tenant_family_member.name, ss: @tenant_family_member.ss }
    end

    assert_redirected_to tenant_family_member_path(assigns(:tenant_family_member))
  end

  test "should show tenant_family_member" do
    get :show, id: @tenant_family_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant_family_member
    assert_response :success
  end

  test "should update tenant_family_member" do
    patch :update, id: @tenant_family_member, tenant_family_member: { dob: @tenant_family_member.dob, gender: @tenant_family_member.gender, marital_status: @tenant_family_member.marital_status, member_type: @tenant_family_member.member_type, name: @tenant_family_member.name, ss: @tenant_family_member.ss }
    assert_redirected_to tenant_family_member_path(assigns(:tenant_family_member))
  end

  test "should destroy tenant_family_member" do
    assert_difference('TenantFamilyMember.count', -1) do
      delete :destroy, id: @tenant_family_member
    end

    assert_redirected_to tenant_family_members_path
  end
end
