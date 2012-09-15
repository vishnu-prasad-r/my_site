class AddAttachmentImgToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.has_attached_file :img
    end
  end

  def self.down
    drop_attached_file :events, :img
  end
end
