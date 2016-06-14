class CreateFoods < ActiveRecord::Migration
  def change

		create_table :foods do |t|
      t.belongs_to :user, index:true
			t.string :name
			t.integer :calories
      t.references :user, index: true, foreign_key: true
			t.timestamps null: false
    end
		add_index :foods, [:user_id, :created_at]
  end
end
