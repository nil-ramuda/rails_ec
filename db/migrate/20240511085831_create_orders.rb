class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :last_name
      t.string :first_name
      t.string :user_name
      t.string :email
      t.string :required_address
      t.string :optional_address
      t.string :country
      t.string :prefecture
      t.string :zip_code
      t.string :credit_card_number
      t.string :cvv
      t.integer :total_price

      t.timestamps
    end
  end
end
