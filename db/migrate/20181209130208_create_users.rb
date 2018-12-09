class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :role
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :spassword
      t.boolean :status,default: true
      t.timestamps
    end
  end
end
