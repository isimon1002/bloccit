class SponsoredPost < ApplicationRecord
    belongs_to :topic
    has_many :comments
end
