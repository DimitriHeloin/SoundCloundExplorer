class AddColumn < ActiveRecord::Migration
  def change
      add_column :users, :username, :string
      change_column :users, :email, :string, :default => ""
      add_column :users, :last_name, :string
      add_column :users, :provider, :string
      add_column :users, :uid, :integer
  end
end
