# frozen_string_literal: true

class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :speciality, :zip_code, :primary_care_recipients
end
