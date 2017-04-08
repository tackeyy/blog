class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :slug
      t.integer :status
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
