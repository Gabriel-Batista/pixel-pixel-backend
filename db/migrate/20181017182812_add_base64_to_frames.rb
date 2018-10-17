class AddBase64ToFrames < ActiveRecord::Migration[5.2]
  def change
    add_column :frames, :base64, :text
  end
end
