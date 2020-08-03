class Recipe < ApplicationRecord
  # Will need to add user_id to recipe model later
  has_one_attached :photo
end
