class AddRememberTokenToBucketters < ActiveRecord::Migration
  def change
    add_column :bucketters, :remember_token, :string
    add_index :bucketters, :remember_token
  end
end
