class Book < ActiveRecord::Base
  belongs_to :author, class_name: "Author", foreign_key: "authors_id"

  attr_accessible :title, :authors_id

  validates :title, presence: true, length: { maximum: 255 }
end
