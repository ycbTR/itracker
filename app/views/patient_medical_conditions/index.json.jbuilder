json.array!(@patient_medical_conditions) do |patient_medical_condition|
  json.extract! patient_medical_condition, :id, :medical_condition_id, :patient_affected, :family_affected
  json.url patient_medical_condition_url(patient_medical_condition, format: :json)
end
