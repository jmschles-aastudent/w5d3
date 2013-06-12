class CreateLinkSubs < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|

      t.timestamps
    end
  end
end
