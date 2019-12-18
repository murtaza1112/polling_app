class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.references :user
      t.integer :category_id

      t.timestamps
    end
  end
end
