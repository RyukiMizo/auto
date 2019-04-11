class CreateHashtagComments < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtag_comments do |t|
      t.string :content
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
