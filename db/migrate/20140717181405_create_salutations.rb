class CreateSalutations < ActiveRecord::Migration
  def change
    create_table :salutations do |t|
      t.string :name

      t.timestamps
    end
  end
end
