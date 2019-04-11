class CreateHashtagLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtag_likes do |t|
      t.string :content
      t.references :like, foreign_key: true

      t.timestamps
    end
  end
end
