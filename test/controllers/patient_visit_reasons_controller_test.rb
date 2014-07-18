require 'test_helper'

class PatientVisitReasonsControllerTest < ActionController::TestCase
  setup do
    @patient_visit_reason = patient_visit_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_visit_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_visit_reason" do
    assert_difference('PatientVisitReason.count') do
      post :create, patient_visit_reason: {  }
    end

    assert_redirected_to patient_visit_reason_path(assigns(:patient_visit_reason))
  end

  test "should show patient_visit_reason" do
    get :show, id: @patient_visit_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_visit_reason
    assert_response :success
  end

  test "should update patient_visit_reason" do
    patch :update, id: @patient_visit_reason, patient_visit_reason: {  }
    assert_redirected_to patient_visit_reason_path(assigns(:patient_visit_reason))
  end

  test "should destroy patient_visit_reason" do
    assert_difference('PatientVisitReason.count', -1) do
      delete :destroy, id: @patient_visit_reason
    end

    assert_redirected_to patient_visit_reasons_path
  end
end
