class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
    	t.integer :id_soundcloud
      	t.string :username
      	t.integer :followings_count
      	t.integer :followers_count

      t.timestamps
    end
  end
end
