class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
    	t.integer :link_id
    	t.integer :user_id
    	
      t.timestamps
    end
  end
end
