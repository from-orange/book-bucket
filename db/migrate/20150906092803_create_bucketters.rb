class CreateBucketters < ActiveRecord::Migration
  def change
    create_table :bucketters do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
