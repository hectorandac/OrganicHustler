class PositionEmblemAdmin < ApplicationRecord
  has_attached_file :picture, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/no-logo.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/


end
