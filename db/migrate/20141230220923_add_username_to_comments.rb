class AddUsernameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :username, :text
  end
end
