class CreateMypolls < ActiveRecord::Migration[6.0]
  def change
    create_table :mypolls do |t|
      t.integer :category_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
