class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :state
      t.integer :postal_code
      t.string :email
      t.string :language

      t.timestamps
    end
  end
end
