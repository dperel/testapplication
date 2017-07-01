class PatientEndorsement < Sequel::Model

	# A patient can endorse a doctor for a characteristic

	many_to_one :endorsing_patient, class: "Patient"
	many_to_one :doctor, class: "Doctor"
	many_to_one :characteristic, class: "Characteristic"
end
