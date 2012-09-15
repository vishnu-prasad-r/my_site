class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      #t.file :picture
      t.text :body
      t.datetime :date

      t.timestamps
    end
  end
end
