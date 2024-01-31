class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    else
      nil
    end
  end
end
