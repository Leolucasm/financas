class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :description, max_length: 35
      t.float :balance, default: 0.00
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
