class Book < ApplicationRecord
    belongs_to :shelf
    # has_one :shelf
end
