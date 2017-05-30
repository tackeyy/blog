class AddDescriptionToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :description, :string, after: :status
  end
end
