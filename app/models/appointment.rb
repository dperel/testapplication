class Appointment < Sequel::Model
	one_to_many :patients, class: "Patient"
	one_to_many :doctors, class: "Doctor"
	one_to_many :appointment_has_services, class: "AppointmentHasService"
	one_to_many :services, class: "Service", through: :appointment_has_services
	one_to_one :review, class: "AppointmentReview"
end
