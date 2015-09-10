class Offer < ActiveRecord::Base
  validate :buyer_id, presence: true
  validate :seller_id, presence: true

  belongs_to :book
end
