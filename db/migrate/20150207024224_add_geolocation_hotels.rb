class AddGeolocationHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :latitude, :decimal, precision: 15, scale: 12
  	add_column :hotels, :longitude, :decimal, precision: 15, scale: 12
  end
end
