class RemoveTeam2FromFixtures < ActiveRecord::Migration
  def up
    remove_column :fixtures, :Team2
      end

  def down
    add_column :fixtures, :Team2, :integer
  end
end
