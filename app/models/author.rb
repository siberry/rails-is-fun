class Author < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :birth_year, presence: true, numericality: {only_integer: true, less_than_or_equal_to: Time.now.year}

  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  def name_and_birthyear
    "#{self.name} (b. #{self.birth_year})"
  end
end
