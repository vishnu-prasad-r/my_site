class RemoveDivisionFromFixtures < ActiveRecord::Migration
  def up
    remove_column :fixtures, :Division
      end

  def down
    add_column :fixtures, :Division, :string
  end
end
