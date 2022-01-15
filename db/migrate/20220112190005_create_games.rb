class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.boolean :win
      t.string :status
      t.string :word
      t.references :user

      t.timestamps
    end
  end
end
