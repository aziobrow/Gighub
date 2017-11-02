class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false

      t.integer :role, null: false, default: 0

      t.index :username, unique: true
      t.index :email, unique: true
    end
  end
end
