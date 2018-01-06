class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :tags, through: :prototype_tags, dependent: :destroy
  has_many :prototype_tags

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images
  accepts_nested_attributes_for :tags

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  # このメソッドで同じ名前のtagがあったらそれを引っ張ってきてそれとprototypeを紐付けている
  def tags_first_or_initialize(prototype)
    tags = []
    prototype.tags.each do |prototype_tag|
      tag = Tag.where(name: prototype_tag.name).first_or_initialize
      tags << tag
    end
    prototype.tags = tags
  end
end
