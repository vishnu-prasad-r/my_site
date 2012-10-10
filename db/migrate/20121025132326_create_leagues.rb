class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.date :year
      t.text :result
      t.boolean :dirty

      t.timestamps
    end
  end
end
