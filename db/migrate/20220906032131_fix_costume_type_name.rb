class FixCostumeTypeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :costumes, :type, :clothing
  end
end
