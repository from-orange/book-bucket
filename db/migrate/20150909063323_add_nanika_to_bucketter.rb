class AddNanikaToBucketter < ActiveRecord::Migration
  def change
    add_column :bucketters, :nanika, :string 
  end
end
