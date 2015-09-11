class AddIndexToBuckettersEmail < ActiveRecord::Migration
  def change
    add_index :bucketters, :email, unique: true
  end
end
