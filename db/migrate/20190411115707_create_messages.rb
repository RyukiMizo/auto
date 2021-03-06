class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :profile_image
      t.string :profile_url
      t.references :user, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
