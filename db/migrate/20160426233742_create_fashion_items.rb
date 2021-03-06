class CreateFashionItems < ActiveRecord::Migration
  def change
    create_table :fashion_items do |t|
      t.references :user, index: true, foreign_key: true
      t.string :sex
      t.string :brand
      t.string :description
      t.string :category
      t.string :sub_category
      t.boolean :sale, null: false, default: false
      t.integer :percentage_off
      t.decimal :price, :precision => 5, :scale => 2
      t.string :unique_affiliate_url
      t.string :shipped_from
      t.decimal :sale_price, :precision => 5, :scale => 2, :default => 0.0
      t.timestamps null: false
    end
  end
end

