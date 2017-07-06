Sequel.migration do
  change do
    create_table(:doctors) do
      primary_key :id
      column :first_name, "text", :null=>false
      column :last_name, "text", :null=>false
      column :dob, "date", :null=>false
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:patients) do
      primary_key :id
      column :first_name, "text", :null=>false
      column :last_name, "text", :null=>false
      column :dob, "date", :null=>false
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:services) do
      primary_key :id
      column :name, "text"
      column :group, "text"
      column :restrictions, "text"
      column :procedure_code, "text"
      column :effective_date, "text"
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:appointments) do
      primary_key :id
      foreign_key :patient_id, :patients, :null=>false, :key=>[:id]
      foreign_key :doctor_id, :doctors, :null=>false, :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
      
      index [:patient_id, :doctor_id]
    end
    
    create_table(:doctor_endorsements) do
      primary_key :id
      foreign_key :receiving_doctor_id, :doctors, :key=>[:id]
      foreign_key :giving_doctor_id, :doctors, :key=>[:id]
      column :content, "text"
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:doctor_has_services) do
      primary_key :id
      foreign_key :doctor_id, :doctors, :key=>[:id]
      foreign_key :service_id, :services, :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:likes) do
      primary_key :id
      foreign_key :doctor_id, :doctors, :key=>[:id]
      foreign_key :patient_id, :patients, :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:patient_endorsements) do
      primary_key :id
      foreign_key :doctor_id, :doctors, :key=>[:id]
      foreign_key :endorsing_patient_id, :patients, :key=>[:id]
      column :content, "text"
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:appointment_has_services) do
      primary_key :id
      foreign_key :appointment_id, :appointments, :key=>[:id]
      foreign_key :service_id, :services, :key=>[:id]
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:appointment_reviews) do
      primary_key :id
      foreign_key :appointment_id, :appointments, :key=>[:id]
      column :content, "text"
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
    
    create_table(:characteristics) do
      primary_key :id
      foreign_key :endorsement_id, :patient_endorsements, :key=>[:id]
      column :content, "text"
      column :created_at, "timestamp with time zone"
      column :updated_at, "timestamp with time zone"
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170630221512_initial.rb')"
  end
end
