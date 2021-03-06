class Author < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, length: { maximum: 255 }
end
