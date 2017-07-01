class AppointmentReview < Sequel::Model
	one_to_one :appointment, class: "Appointment"
end
