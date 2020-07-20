class Gear < ApplicationRecord
    belongs_to :user
    has_many :tripgears
    has_many :trips, through: :tripgears
end
