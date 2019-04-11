class AddColumnTitles < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string
    add_column :users, :url, :string
    add_column :users, :follower_number, :integer
    add_column :users, :follow_number, :integer
    add_column :users, :like_number, :integer
    add_column :users, :connection, :boolean, default: false, null: false
    add_column :users, :follow_connection, :boolean, default: false, null: false
    add_column :users, :unfollow_connection, :boolean, default: false, null: false
    add_column :users, :like_connection, :boolean, default: false, null: false
    add_column :users, :comment_connection, :boolean, default: false, null: false
    add_column :users, :message_connection, :boolean, default: false, null: false
    add_column :users, :follow_time, :datetime
    add_column :users, :like_time, :datetime
    add_column :users, :comment_timer, :datetime
    add_column :users, :message_time, :datetime
  end
end
