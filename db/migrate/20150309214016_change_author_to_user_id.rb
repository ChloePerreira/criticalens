class ChangeAuthorToUserId < ActiveRecord::Migration
  def change
    rename_column :critiques, :author, :user_id
  end
end
