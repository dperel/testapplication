Sequel.migration do
  change do
    create_table(:doctors) do
      primary_key :id
      column :first_name, "text", :null=>false
      column :last_name, "text", :null=>false
      column :dob, "date", :null=>false
    end
    
    create_table(:patients) do
      primary_key :id
      column :first_name, "text", :null=>false
      column :last_name, "text", :null=>false
      column :dob, "date", :null=>false
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:services) do
      primary_key :id
      column :name, "text"
    end
    
    create_table(:appointments) do
      primary_key :id
      foreign_key :patient_id, :patients, :key=>[:id]
      foreign_key :doctor_id, :doctors, :key=>[:id]
      
      index [:patient_id, :doctor_id]
    end
    
    create_table(:doctor_has_services) do
      primary_key :id
      foreign_key :doctor_id, :doctors, :key=>[:id]
      foreign_key :service_id, :services, :key=>[:id]
    end
  end
end
Sequel.migration do
  change do
    self << "SET search_path TO \"$user\", public"
    self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20170630221512_initial.rb')"
  end
end
