class CreateGuideCategories < ActiveRecord::Migration
  def change
    create_table :categories_guides, :id => false do |t|
    	t.references :guide
    	t.references :category
    end
    add_index :categories_guides, [:guide_id, :category_id]
    add_index :categories_guides, :category_id
  end
end
