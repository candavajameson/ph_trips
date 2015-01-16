class AddExcerptToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :excerpt, :text
  end
end
