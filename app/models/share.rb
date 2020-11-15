class Share < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true, length: { maximum: 255 }
    validates :place, presence: true, length: { maximum: 50 }
end
