class ImproveLinkSubs < ActiveRecord::Migration
  def change
  	add_column :link_subs, :sub_id, :integer
  	add_column :link_subs, :link_id, :integer
  end
end
