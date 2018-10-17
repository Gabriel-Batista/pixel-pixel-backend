class Palette < ApplicationRecord
    belongs_to :project
    has_many :colors
end
