require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complaints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post :create, complaint: { apartment_complaint: @complaint.apartment_complaint, complaintable_id: @complaint.complaintable_id, complaintable_type: @complaint.complaintable_type, date_filed: @complaint.date_filed, rental_complaint: @complaint.rental_complaint, status: @complaint.status }
    end

    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should show complaint" do
    get :show, id: @complaint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @complaint
    assert_response :success
  end

  test "should update complaint" do
    patch :update, id: @complaint, complaint: { apartment_complaint: @complaint.apartment_complaint, complaintable_id: @complaint.complaintable_id, complaintable_type: @complaint.complaintable_type, date_filed: @complaint.date_filed, rental_complaint: @complaint.rental_complaint, status: @complaint.status }
    assert_redirected_to complaint_path(assigns(:complaint))
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete :destroy, id: @complaint
    end

    assert_redirected_to complaints_path
  end
end
