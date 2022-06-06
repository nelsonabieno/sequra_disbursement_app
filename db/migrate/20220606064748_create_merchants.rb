class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :cif
    end
  end
end
