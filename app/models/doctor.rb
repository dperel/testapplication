class Doctor < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :patients, class: "Patient", through: :appointments
	one_to_many :patient_endorsements, class: "PatientEndorsement"
	one_to_many :endorsements_given, class: "DoctorEndorsement", key: :endorsing_doctor_id
	one_to_many :endorsements_received, class: "DoctorEndorsement", key: :doctor_id
	one_to_many :likes, class: "Like"
end
