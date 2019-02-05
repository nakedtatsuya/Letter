class Letter < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :from_name,
            presence: true,
            length: {
                maximum: 6,
                too_long: "名前は６文字までしか入れられません"
            }
  validates :message,
            presence: true,
            length: { maximum: 200 }
  validates :to_name,
            presence: true,
            length: { maximum: 6 }
end
