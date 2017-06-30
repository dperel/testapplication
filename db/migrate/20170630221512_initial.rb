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

        create_table(:appointments) do
            primary_key :id
            foreign_key :patient_id, :patients
            foreign_key :doctor_id, :doctors
            index [:patient_id, :doctor_id], unique: false
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
    end
end
