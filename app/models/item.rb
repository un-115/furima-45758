class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee_payer
  belongs_to :prefecture
  belongs_to :shopping_day

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name,     presence: true
  validates :info,     presence: true
  validates :image,    presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :fee_payer_id
    validates :prefecture_id
    validates :shopping_day_id
  end
end
