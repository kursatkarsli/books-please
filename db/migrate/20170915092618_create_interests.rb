class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :is_owner
      t.integer :status
      t.integer :status_position
      t.boolean :is_favourite
      t.integer :favourite_position
      t.integer :rank
      t.text :comment

      t.timestamps
    end
  end
end
