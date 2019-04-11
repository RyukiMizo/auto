class CreateUnfollows < ActiveRecord::Migration[5.1]
  def change
    create_table :unfollows do |t|
      t.string :name
      t.string :profile_image
      t.string :profile_url
      t.references :user, foreign_key: true
      t.datetime :unfollow_time

      t.timestamps
    end
  end
end
