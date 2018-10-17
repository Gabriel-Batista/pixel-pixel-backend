class CreateColors < ActiveRecord::Migration[5.2]
    def change
        create_table :colors do |t|
            t.string :rgb
            t.string :hex
            t.integer :pallete_id
            t.timestamps
        end
    end
end
