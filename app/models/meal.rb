# frozen_string_literal: true

class Meal < ApplicationRecord
  belongs_to :ingredient, inverse_of: :meals
  belongs_to :recipe, inverse_of: :meals
end
