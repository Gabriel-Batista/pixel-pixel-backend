class ChangePalletteIdToPaletteIdInColors < ActiveRecord::Migration[5.2]
    def change
        rename_column :colors, :pallete_id, :palette_id
    end
end
