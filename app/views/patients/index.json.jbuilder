json.array!(@patients) do |patient|
  json.extract! patient, :id, :firstname, :middlename, :lastname, :date_of_birth, :sex, :addr1, :addr2, :city, :state, :zip_code, :phone1, :phone2, :salutation_id, :email1, :email2, :facebook_account, :twitter_account
  json.url patient_url(patient, format: :json)
end
