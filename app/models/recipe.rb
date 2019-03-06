# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :meal_recipe,
             class_name: 'Ingredient',
             inverse_of: 'meal_recipe'

  validates :name, presence: true
  validates :directions, presence: true

  has_many :meals, dependent: :destroy
  has_many :ingredients, through: :meals
end
