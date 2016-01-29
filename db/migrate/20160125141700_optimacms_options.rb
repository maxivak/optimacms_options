class OptimacmsOptionsCreate < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name, :null => false
      t.string :title, :null => false
      t.string :title, :null => false
      t.text :description, :null => true
      t.boolean :is_changed, :null => true, :default=>1
      t.string :category, :null => true
      t.string :value, :null => true

    end

    add_index :options, :name, :unique => true
  end
end
