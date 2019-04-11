class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :name
      t.string :profile_image
      t.string :profile_url
      t.references :user, foreign_key: true
      t.integer :maximum, default: 20
      t.integer :minimum, default: 0

      t.timestamps
    end
  end
end
