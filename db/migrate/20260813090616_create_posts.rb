class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
