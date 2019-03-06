# frozen_string_literal: true

class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :primary_care_physician
end
