class Post < ApplicationRecord
    validates :content, length: {minimum: 1}
    validates :content, length: {maximum: 200}
end
