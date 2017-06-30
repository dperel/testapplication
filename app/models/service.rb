class Service < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :patients, class: "Patient", through: :appointments
	one_to_many :appointment_has_services, class: "AppointmentHasService"
	one_to_many :services, class: "Service", through: :appointment_has_services
end
