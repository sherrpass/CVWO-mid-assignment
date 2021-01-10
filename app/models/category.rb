class Category < ApplicationRecord
  validates :name, uniqueness: { scope: :user_id }, presence: true
  belongs_to :user
  has_many :todo_categories
  has_many :todos, through: :todo_categories
end
