class Like < Sequel::Model
	many_to_one :doctor, class: "Doctor"
	many_to_one :patient, class: "Patient"
end
