json.array!(@visits) do |visit|
  json.extract! visit, :id, :date_visit, :length_since_last_visit, :lens_use_per_day, :lens_first_use, :dilation_consent, :privacy_consent, :test_result, :patient_id, :current_meds, :med_allergy, :med_allergy_list
  json.url visit_url(visit, format: :json)
end
