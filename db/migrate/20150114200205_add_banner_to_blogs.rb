class AddBannerToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :banner, :string
  end
end
