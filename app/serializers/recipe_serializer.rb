# frozen_string_literal: true

class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :directions
end
