class Book < ActiveRecord::Base
  belongs_to :bucketter
  validates :title, presence: true
  validates :auther, presence: true
  validates :version, presence: true
  validates :publisher, presence: true

  has_many :offers
end
