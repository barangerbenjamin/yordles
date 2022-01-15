class CreateAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :attempts do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :words, array: true, default: []
      t.integer :points, default: 0
      t.boolean :finished, default: false
      t.boolean :solved, default: false
      t.timestamps
    end
  end
end
