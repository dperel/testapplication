class DoctorEndorsement < Sequel::Model
	many_to_one :endorsing_doctor, class: "Doctor"
	many_to_one :doctor, class: "Doctor"
end
