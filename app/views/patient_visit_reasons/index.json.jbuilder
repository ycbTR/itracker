json.array!(@patient_visit_reasons) do |patient_visit_reason|
  json.extract! patient_visit_reason, :id
  json.url patient_visit_reason_url(patient_visit_reason, format: :json)
end
