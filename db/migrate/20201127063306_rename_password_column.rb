class RenamePasswordColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :admins, :password, :password_digest
    rename_column :users, :password, :password_digest
  end
end
