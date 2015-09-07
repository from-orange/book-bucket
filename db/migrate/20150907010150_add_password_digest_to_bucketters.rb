class AddPasswordDigestToBucketters < ActiveRecord::Migration
  def change
    add_column :bucketters, :password_digest, :string
    add_column :bucketters, :password, :string
    add_column :bucketters, :password_confirmation, :string
  end
end
