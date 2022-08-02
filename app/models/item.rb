class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options numericality: { other_than: 1, message: "can't be blank" } do
   validates :category_id 
   validates :condition_id
   validates :delivery_charge_id
   validates :prefecture_id
   validates :delivery_day_id
  end

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true

 with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },presence: { message: "can't be blank" }
 end
  
end
