class Characteristic < Sequel::Model
	one_to_many :patient_endorsement, class: "PatientEndorsement"
end
