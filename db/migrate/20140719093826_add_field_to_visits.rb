class AddFieldToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :sleep_with_lens, :boolean
  end
end
