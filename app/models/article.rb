class Article < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum: 30}
    
    belongs_to :project
end
