class AddAccessSummaryToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :access_summary, :text
  end
end
