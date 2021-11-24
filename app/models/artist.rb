class Artist < ApplicationRecord
    validates :name, :bio, presence: true
    validates :name, uniqueness: true

    has_one_attached :avatar
end
