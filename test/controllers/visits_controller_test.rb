require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  setup do
    @visit = visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visit" do
    assert_difference('Visit.count') do
      post :create, visit: { current_meds: @visit.current_meds, date_visit: @visit.date_visit, dilation_consent: @visit.dilation_consent, length_since_last_visit: @visit.length_since_last_visit, lens_first_use: @visit.lens_first_use, lens_use_per_day: @visit.lens_use_per_day, med_allergy: @visit.med_allergy, med_allergy_list: @visit.med_allergy_list, patient_id: @visit.patient_id, privacy_consent: @visit.privacy_consent, test_result: @visit.test_result }
    end

    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should show visit" do
    get :show, id: @visit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visit
    assert_response :success
  end

  test "should update visit" do
    patch :update, id: @visit, visit: { current_meds: @visit.current_meds, date_visit: @visit.date_visit, dilation_consent: @visit.dilation_consent, length_since_last_visit: @visit.length_since_last_visit, lens_first_use: @visit.lens_first_use, lens_use_per_day: @visit.lens_use_per_day, med_allergy: @visit.med_allergy, med_allergy_list: @visit.med_allergy_list, patient_id: @visit.patient_id, privacy_consent: @visit.privacy_consent, test_result: @visit.test_result }
    assert_redirected_to visit_path(assigns(:visit))
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete :destroy, id: @visit
    end

    assert_redirected_to visits_path
  end
end
