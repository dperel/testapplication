class Appointment < Sequel::Model
	one_to_many :patients, class: "Patient"
	one_to_many :doctors, class: "Doctor"
end
