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
end
