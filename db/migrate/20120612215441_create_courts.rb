class CreateCourts < ActiveRecord::Migration
  def change
    create_table :courts do |t|
      t.string :court
      t.boolean :lights
      t.string :name
      t.string :address
      t.string :home
      t.string :mobile

      t.timestamps
    end
  end
end
