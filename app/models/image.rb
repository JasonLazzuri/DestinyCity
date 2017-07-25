class Image < ApplicationRecord

  belongs_to :product

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "400x400>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
