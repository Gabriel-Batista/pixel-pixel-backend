class AddLocalIdToFrames < ActiveRecord::Migration[5.2]
    def change
        add_column :frames, :local_id, :string
    end
end
