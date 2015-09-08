class AddColumToBooks < ActiveRecord::Migration
  def change
    add_column :books, :status, :string
    add_column :books, :category, :string
    add_column :books, :cost, :string
    add_column :books, :version, :integer
    add_column :books, :publisher, :string
    add_column :books, :auther, :string

    add_index :books, :category
    add_index :books, :publisher
    add_index :books, :auther
  end
end
