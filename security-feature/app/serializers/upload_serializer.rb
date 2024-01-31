class UploadSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  def image_url
    return rails_blob_path(object.image, only_path: true)
  end
  attributes :id, :name, :image_url

end
