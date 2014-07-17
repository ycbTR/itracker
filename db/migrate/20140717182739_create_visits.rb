class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date_visit
      t.date :length_since_last_visit
      t.integer :lens_use_per_day
      t.boolean :lens_first_use
      t.boolean :dilation_consent
      t.boolean :privacy_consent
      t.text :test_result
      t.integer :patient_id
      t.text :current_meds
      t.boolean :med_allergy
      t.text :med_allergy_list

      t.timestamps
    end
  end
end
