Sequel.migration do

    change do
        create_table(:patients) do
            primary_key :id
            String :first_name, null: false
            String :last_name, null: false
            Date :dob, null: false
        end

        create_table(:doctors) do
            primary_key :id
            String :first_name, null: false
            String :last_name, null: false
            Date :dob, null: false
        end

        create_table(:services) do
            primary_key :id
            String :name
        end

        create_table(:doctor_has_services) do
            primary_key :id
            foreign_key :doctor_id, :doctors
            foreign_key :service_id, :services
        end

        create_table(:appointments) do
            primary_key :id
            foreign_key :patient_id, :patients, null: false
            foreign_key :doctor_id, :doctors, null: false
            index [:patient_id, :doctor_id], unique: false
        end

        create_table(:appointment_has_services) do
            primary_key :id
            foreign_key :appointment_id, :appointments
            foreign_key :service_id, :services
        end

    end
end
