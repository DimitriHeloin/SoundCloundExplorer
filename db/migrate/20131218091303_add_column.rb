class AddColumn < ActiveRecord::Migration
  def change
      add_column :users, :username, :string
      change_column :users, :email, :string, :default => ""
  end
end
