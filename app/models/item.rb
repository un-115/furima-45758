class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_payer
  belongs_to :prefecture
  belongs_to :shopping_day

  belongs_to :user
  has_one_attached :image
end
