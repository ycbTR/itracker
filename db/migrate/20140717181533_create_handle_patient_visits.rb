class CreateHandlePatientVisits < ActiveRecord::Migration
  def change
    create_table :handle_patient_visits do |t|
      t.integer :user_id
      t.integer :visit_id

      t.timestamps
    end
  end
end
