class CreateFoodGroups < ActiveRecord::Migration
  def change
    create_table :food_groups do |t|
      t.string :menuName
      t.string :searchName
	t.timestamps null: false
    end
  end
end
