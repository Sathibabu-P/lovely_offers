class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.belongs_to :store
      t.string :name
      t.string :code
      t.text :description
      t.boolean :status,default: true
      t.string :url  
      t.timestamps
    end
  end
end
