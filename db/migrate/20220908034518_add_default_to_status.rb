class AddDefaultToStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, "Available"
  end
end
