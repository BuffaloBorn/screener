class Book < ActiveRecord::Base
  belongs_to :author

  attr_accessible :title

  validates :title, presence: true, length: { maximum: 255 }
end
