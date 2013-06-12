class AddAuthorIdToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :author_id, :integer
  end
end
