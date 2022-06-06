class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.references :merchant, foreign_key: true
      t.float :disbursed_amount
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
