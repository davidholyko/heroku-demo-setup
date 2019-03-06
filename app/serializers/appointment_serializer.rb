class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :doctor
  has_one :patient
end
