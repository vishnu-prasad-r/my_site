class RemoveTeam1FromFixtures < ActiveRecord::Migration
  def up
    remove_column :fixtures, :Team1
      end

  def down
    add_column :fixtures, :Team1, :integer
  end
end
