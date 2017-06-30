class Doctor < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :patients, class: "Patient", through: :appointments
end
