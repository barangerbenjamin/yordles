class AddDeviseGuestsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table(:users) do |t|
      ## Database authenticatable
      t.boolean :guest, :default => false
    end
  end
end
