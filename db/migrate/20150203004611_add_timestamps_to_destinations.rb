class AddTimestampsToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :created_at, :datetime
    add_column :destinations, :updated_at, :datetime
  end
end
