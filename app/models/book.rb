class Book < ApplicationRecord
    belongs_to :shelf
    validates :isbn_code, presence: true
    validates :title, presence: true, length: { maximum: 255 }
    validates :author, presence: true, length: { maximum: 255 }
    validates :publisher, presence: true, length: { maximum: 255 }
    validates :shelf_id, presence: true
end
