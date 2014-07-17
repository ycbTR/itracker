class CreatePatientMedicalConditions < ActiveRecord::Migration
  def change
    create_table :patient_medical_conditions do |t|
      t.boolean :patient_affected
      t.boolean :family_affected
      t.integer :patient_id
      t.integer :medical_condition_id

      t.timestamps
    end
  end
end
