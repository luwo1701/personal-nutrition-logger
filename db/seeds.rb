# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   foodgroupsArr = ['American Indian/Alaska Native Foods','Baby Foods','Baked Products','Beef Products','Beverages','Branded Food Products Database','Breakfast Cereals','Cereal Grains and Pasta','Fast Foods','Fats and Oils','Finfish and Shellfish Products','Fruits and Fruit Juices','Lamb, Veal, and Game Products','Legumes and Legume Products','Meals, Entrees, and Side Dishes','Nut and Seed Products','Pork Products','Poultry Products','Restaurant Foods','Sausages and Luncheon Meats','Snacks','Soups, Sauces, and Gravies','Spices and Herbs','Sweets','Vegetables and Vegetable Products']
   for i in 0..foodgroupsArr.length()
     food_groups = FoodGroup.create(menuName: foodgroupsArr[i], searchName: foodgroupsArr[i].gsub(/'<space>*'/,'%20') )
   end
