require 'test_helper'

class PatientMedicalConditionsControllerTest < ActionController::TestCase
  setup do
    @patient_medical_condition = patient_medical_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_medical_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_medical_condition" do
    assert_difference('PatientMedicalCondition.count') do
      post :create, patient_medical_condition: { family_affected: @patient_medical_condition.family_affected, medical_condition_id: @patient_medical_condition.medical_condition_id, patient_affected: @patient_medical_condition.patient_affected }
    end

    assert_redirected_to patient_medical_condition_path(assigns(:patient_medical_condition))
  end

  test "should show patient_medical_condition" do
    get :show, id: @patient_medical_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_medical_condition
    assert_response :success
  end

  test "should update patient_medical_condition" do
    patch :update, id: @patient_medical_condition, patient_medical_condition: { family_affected: @patient_medical_condition.family_affected, medical_condition_id: @patient_medical_condition.medical_condition_id, patient_affected: @patient_medical_condition.patient_affected }
    assert_redirected_to patient_medical_condition_path(assigns(:patient_medical_condition))
  end

  test "should destroy patient_medical_condition" do
    assert_difference('PatientMedicalCondition.count', -1) do
      delete :destroy, id: @patient_medical_condition
    end

    assert_redirected_to patient_medical_conditions_path
  end
end
