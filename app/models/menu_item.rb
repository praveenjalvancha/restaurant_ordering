class MenuItem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_presence_of [:price, :category]
  has_attached_file :item_image, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :item_image, content_type: /\Aimage\/.*\z/
  CATEGORIES = ["Food", "Drinks"]
  
  def self.available_items category=nil
    category ? where(available: true, category: category) : where(available: true)
  end

  def self.is_exist_all_items(selected_items='')
  	return false if selected_items.blank? || selected_items.class == Array
  	selected_items = selected_items.split(',').map{|s| s.to_i}
  	all_items = available_items.map(&:id)
  	result = !(selected_items.map{|item| all_items.include? item }.include? false)
  	{is_exist_all: result, orderd_items: selected_items}
  end
end
