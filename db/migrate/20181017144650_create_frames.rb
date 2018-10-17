class CreateFrames < ActiveRecord::Migration[5.2]
    def change
        create_table :frames do |t|
            t.text :base64
            t.timestamps
        end
    end
end
