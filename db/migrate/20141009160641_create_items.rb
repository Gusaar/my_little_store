class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.string :slug, index: true
      t.decimal :price, precision: 5, scale: 2, default: 0.00
      t.text :description

      t.timestamps
    end
  end
end
