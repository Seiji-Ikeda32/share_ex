class Share < ApplicationRecord
    validates :title, presence: true, length: { maximum: 30 }
    validates :content, presence: true, length: { maximum: 255 }
    validates :place, presence: true, length: { maximum: 30 }
    
    belongs_to :user
end
