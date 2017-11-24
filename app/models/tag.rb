class Tag < ActiveRecord::Base
  has_many :protoypes, through: :prototype_tags,
  has_many :prototype_tags
  validates :name,presence:true,
end
