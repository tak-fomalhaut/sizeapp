class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :text, null: false
      t.text :image
      t.string :season
      # t.references :user, foreign_key: true
      # t.references :size, foreign_key: true 
      t.timestamps
    end
  end
end
