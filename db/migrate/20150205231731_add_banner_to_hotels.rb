class AddBannerToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :banner, :string
  end
end
