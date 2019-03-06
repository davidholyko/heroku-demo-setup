# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :doctor, inverse_of: :appointments
  belongs_to :patient, inverse_of: :appointments
end
