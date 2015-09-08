class AddAdminToBucketters < ActiveRecord::Migration
  def change
    add_column :bucketters, :admin, :boolean, deafault: false
  end
end
