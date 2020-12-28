class Todo < ApplicationRecord
  validates_presence_of :created_at # for some reason adding completed and important to this will always throw an error regardless
  validates_inclusion_of :important, :completed, in: [true, false]
  validates :title, presence: true, length: {minimum: 5, maximum:200}
  validates :description, length: {maximum:10000}
  has_many :todo_categories
  has_many :categories, through: :todo_categories
end
