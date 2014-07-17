class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :date_of_birth
      t.string :sex
      t.string :addr1
      t.string :addr2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone1
      t.string :phone2
      t.integer :salutation_id
      t.string :email1
      t.string :email2
      t.string :facebook_account
      t.string :twitter_account

      t.timestamps
    end
  end
end
