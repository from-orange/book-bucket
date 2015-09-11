class Offer < ActiveRecord::Base
  # validates :buyer_id, presence: true
  # validates :seller_id, presence: true

  belongs_to :book
end
