class AddAvatarFileNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :avatar_file_name, :text
  end
end
