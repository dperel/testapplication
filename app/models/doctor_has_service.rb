class DoctorHasService < Sequel::Model
	one_to_many :doctors, class: "Doctor"
	one_to_many :services, class: "Service"
end
