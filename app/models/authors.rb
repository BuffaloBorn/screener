class Authors < ActiveRecord::Base
  attr_accessible :f_name, :l_name

  def self.name
    "#{f_name} #{l_name}"
  end

  validates :f_name, presence: true, length: { maximum: 255 }
  validates :l_name, presence: true, length: { maximum: 255 }
end
