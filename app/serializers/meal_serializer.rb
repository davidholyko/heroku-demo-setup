class MealSerializer < ActiveModel::Serializer
  attributes :id, :amount, :unit, :date
  has_one :ingredient
  has_one :recipe
end
