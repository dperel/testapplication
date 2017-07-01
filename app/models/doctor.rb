class Doctor < Sequel::Model
	one_to_many :appointments, class: "Appointment"
	one_to_many :patients, class: "Patient", through: :appointments
	one_to_many :patient_endorsements, class: "PatientEndorsement"
	one_to_many :doctor_endorsements, class: "DoctorEndorsement", as: :endorsing_doctor
	one_to_many :doctor_endorsements, class: "DoctorEndorsement", as: :doctor 
end
