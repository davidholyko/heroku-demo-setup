# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :author_id
end
