class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :attachment
      t.integer :viewable_id
      t.string :viewable_type
      t.string :type
      t.timestamps
    end
  end
end
