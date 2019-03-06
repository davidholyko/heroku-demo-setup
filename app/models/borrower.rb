# frozen_string_literal: true

class Borrower < ApplicationRecord
  has_many :loans
  has_many :books, through: :loans
end
