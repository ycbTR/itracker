class ChangeDataTypeOfFacebookTwitter < ActiveRecord::Migration
  def change
    change_column :patients, :facebook_account, :boolean
    change_column :patients, :twitter_account, :boolean
  end
end
