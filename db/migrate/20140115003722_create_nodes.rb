class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :id_soundcloud
      t.string :username

      t.timestamps
    end
  end
end
