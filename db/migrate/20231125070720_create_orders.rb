class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.json :details
      t.float :price
      t.float :savings

      t.timestamps
    end
  end
end
