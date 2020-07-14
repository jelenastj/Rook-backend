class Trip < ApplicationRecord
    belongs_to :user
    has_many :gears, through: :tripgears
end
