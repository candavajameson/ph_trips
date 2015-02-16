class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :title
      t.string :banner
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
