class PatientEndorsement < Sequel::Model
	many_to_one :endorsing_patient, class: "Patient"
	many_to_one :doctor, class: "Doctor"
end
