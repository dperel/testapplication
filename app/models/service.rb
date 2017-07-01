class Service < Sequel::Model
	one_to_many :patients, class: "Patient", through: :appointments
	one_to_many :appointment_has_services, class: "AppointmentHasService"
	one_to_many :appointments, class: "Appointment", through: :appointment_has_services
	one_to_many :doctor_endorsements, class: "DoctorEndorsement"
end
