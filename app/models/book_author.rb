class BookAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates_uniqueness_of :book, scope: :author
end
