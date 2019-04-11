class CreateHashtagFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtag_follows do |t|
      t.string :content
      t.references :follow, foreign_key: true

      t.timestamps
    end
  end
end
