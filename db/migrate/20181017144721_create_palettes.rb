class CreatePalettes < ActiveRecord::Migration[5.2]
    def change
        create_table :palettes do |t|
            t.integer :project_id
            t.timestamps
        end
    end
end
