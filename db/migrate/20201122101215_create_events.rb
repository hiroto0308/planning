class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string      :product,                null: false       
      t.text        :introduction,           null: false       
      t.integer     :category_id,            null: false 
      t.integer     :delivery_area_id,       null: false                           
      t.integer     :price,                  null: false       
      t.integer     :time_all_id,            null: false       
      t.datetime    :start,                  null: false       
      t.references  :user,                   foreign_key: true 
      t.timestamps
    end
  end
end
