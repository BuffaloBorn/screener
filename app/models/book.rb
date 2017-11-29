class Book < ActiveRecord::Base
  belongs_to :author, class_name: "Author", foreign_key: "author_id"

  attr_accessible :title, :author_id

  validates :title, presence: true, length: { maximum: 255 }
end
