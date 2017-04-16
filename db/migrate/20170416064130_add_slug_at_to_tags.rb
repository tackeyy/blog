class AddSlugAtToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :slug, :string
  end
end
