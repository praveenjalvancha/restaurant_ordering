class AddAttachmentItemImageToMenuItems < ActiveRecord::Migration
  def self.up
    change_table :menu_items do |t|
      t.attachment :item_image
    end
  end

  def self.down
    remove_attachment :menu_items, :item_image
  end
end
