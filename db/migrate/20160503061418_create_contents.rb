class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      
      t.integer :post_id
      
      #동아리명
      t.string :name
      
      #대표메뉴, 가격
      t.string :menu1
      t.string :menu2
      t.string :menu3
      t.integer :price1
      t.integer :price2
      t.integer :price3
      
      #소개
      t.string :text
      
      #위치
      t.string :location
      
      t.string :pwd

      t.timestamps null: false
    end
  end
end
