class Recipe < ApplicationRecord
  # Will need to add user_id to recipe model later
  has_one_attached :photo
  belongs_to :user
  has_many :reviews

  validates :name, :description, :photo, presence: true

  has_many :ingredients
  has_many :instructions

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :instructions, reject_if: :all_blank, allow_destroy: true

end
