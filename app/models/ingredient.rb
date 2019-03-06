# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :meal_ingredient,
             class_name: 'Recipe',
             foreign_key: 'recipe_id',
             inverse_of: 'meal_ingredient'

  validates :name, presence: true
  validates :unit, presence: true

  has_many :meals, dependent: :destroy
  has_many :recipe, through: :meals
end
