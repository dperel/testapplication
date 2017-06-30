class AppointmentHasService < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :services, class: "Service"
end
