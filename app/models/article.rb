class Article < ApplicationRecord
  #dependent: option allows you to delete an article,
  #and it's associated comments, preventing orphans
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
