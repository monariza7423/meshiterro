class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favolites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      'no_image.jpg'
    end
  end

  def favolited_by?(user)
    favolites.exists?(user_id: user.id)
  end

end
