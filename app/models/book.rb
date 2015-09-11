class Book < ActiveRecord::Base
  belongs_to :bucketter
  validates :title, presence: true

  has_many :offers
end
