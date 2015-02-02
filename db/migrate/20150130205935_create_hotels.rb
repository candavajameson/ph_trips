class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.references :destination, index: true
      t.text :address
    end
  end
end
