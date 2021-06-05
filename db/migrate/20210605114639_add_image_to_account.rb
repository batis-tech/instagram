class AddImageToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :image,:string
    add_column :accounts, :description,:string
    add_column :accounts, :website,:string

  end
end
