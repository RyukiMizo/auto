class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :instagram_email, :string
    add_column :users, :instagram_password, :string
  end
end
