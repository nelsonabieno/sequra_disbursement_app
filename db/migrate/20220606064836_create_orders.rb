class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :merchant, foreign_key: true
      t.references :shopper, foreign_key: true
      t.float :amount
      t.datetime :created_at
      t.datetime :completed_at
    end
  end
end
