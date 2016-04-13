require 'test_helper'

class RentalInvoicesControllerTest < ActionController::TestCase
  setup do
    @rental_invoice = rental_invoices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rental_invoices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rental_invoice" do
    assert_difference('RentalInvoice.count') do
      post :create, rental_invoice: { cc_amount_charged: @rental_invoice.cc_amount_charged, cc_expiration_date: @rental_invoice.cc_expiration_date, cc_number: @rental_invoice.cc_number, cc_type: @rental_invoice.cc_type, invoice_date: @rental_invoice.invoice_date, invoice_due: @rental_invoice.invoice_due }
    end

    assert_redirected_to rental_invoice_path(assigns(:rental_invoice))
  end

  test "should show rental_invoice" do
    get :show, id: @rental_invoice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rental_invoice
    assert_response :success
  end

  test "should update rental_invoice" do
    patch :update, id: @rental_invoice, rental_invoice: { cc_amount_charged: @rental_invoice.cc_amount_charged, cc_expiration_date: @rental_invoice.cc_expiration_date, cc_number: @rental_invoice.cc_number, cc_type: @rental_invoice.cc_type, invoice_date: @rental_invoice.invoice_date, invoice_due: @rental_invoice.invoice_due }
    assert_redirected_to rental_invoice_path(assigns(:rental_invoice))
  end

  test "should destroy rental_invoice" do
    assert_difference('RentalInvoice.count', -1) do
      delete :destroy, id: @rental_invoice
    end

    assert_redirected_to rental_invoices_path
  end
end
