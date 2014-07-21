class ChangeDataFormatOfVisitDate < ActiveRecord::Migration
  def change
    change_column :visits, :date_visit, :date

    Visit.all.each do |visit|
      visit.update_column('date_visit', visit.date_visit)
    end
  end
end
