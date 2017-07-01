class Patient < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :doctors, class: "Doctor", through: :appointments
	one_to_many :patient_endorsements, class: "PatientEndorsement"
end
