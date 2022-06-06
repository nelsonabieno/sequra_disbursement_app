class CreateShoppers < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :nif
    end
  end
end
