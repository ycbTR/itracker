class CreatePatientVisitReasons < ActiveRecord::Migration
  def change
    create_table :patient_visit_reasons do |t|
      t.integer :visit_id
      t.integer :reason_id

      t.timestamps
    end
  end
end
