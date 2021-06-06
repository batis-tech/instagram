class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :follower, references: :account
        t.references :following, references: :account
      t.timestamps
    end
  end
end
