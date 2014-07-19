class ChangeDataTypeOfFacebookTwitter < ActiveRecord::Migration
  def change
    remove_column :patients, :facebook_account
    remove_column :patients, :twitter_account

    add_column :patients, :facebook_account, :boolean
    add_column :patients, :twitter_account, :boolean
  end
end
