Sequel.migration do

    change do
        create_table(:patients) do
            primary_key :id
            String :first_name, null: false
            String :last_name, null: false
            Date :dob, null: false
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:doctors) do
            primary_key :id
            String :first_name, null: false
            String :last_name, null: false
            Date :dob, null: false
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:services) do
            primary_key :id
            String :name
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:doctor_has_services) do
            primary_key :id
            foreign_key :doctor_id, :doctors
            foreign_key :service_id, :services
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:appointments) do
            primary_key :id
            foreign_key :patient_id, :patients, null: false
            foreign_key :doctor_id, :doctors, null: false
            index [:patient_id, :doctor_id], unique: false
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:appointment_has_services) do
            primary_key :id
            foreign_key :appointment_id, :appointments
            foreign_key :service_id, :services
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:appointment_reviews) do
            primary_key :id
            foreign_key :appointment_id, :appointments
            String :content
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:patient_endorsements) do
            primary_key :id
            foreign_key :doctor_id, :doctors
            foreign_key :endorsing_patient_id , :patients
            String :content
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:doctor_endorsements) do
            primary_key :id
            foreign_key :doctor_id, :doctors
            foreign_key :endorsing_doctor_id, :doctors
            String :content
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

        create_table(:likes) do
            primary_key :id
            foreign_key :doctor_id, :doctors
            foreign_key :patient_id, :patients
            TimestampTZ :created_at
            TimestampTZ :updated_at
        end

    end
end
