class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|      
      t.string :name
      t.text :description
      t.integer :sort,default: 0
      t.boolean :status,default: true
      t.boolean :topbrand,default: false
      t.timestamps
    end
    create_table :categories_stores, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :store, index: true
    end
  end
end
