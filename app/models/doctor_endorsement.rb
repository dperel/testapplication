class DoctorEndorsement < Sequel::Model

	# A doctor can endorse another doctor for a specific service 

	many_to_one :endorsing_doctor, class: "Doctor"
	many_to_one :doctor, class: "Doctor"
	many_to_one :service, class: "Service"
end
