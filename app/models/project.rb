class Project < ApplicationRecord
    has_many :palettes
    has_many :frames
    belongs_to :user
end
