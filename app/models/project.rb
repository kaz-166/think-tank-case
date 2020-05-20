class Project < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :name, length: {minimum: 1}
    validates :name, length: {maximum: 30}

    has_many :articles
    belongs_to :user
end
