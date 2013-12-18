class AddAuthTokenColumn < ActiveRecord::Migration
  def change
    add_column :users, :authentification_token, :string
  end
end
