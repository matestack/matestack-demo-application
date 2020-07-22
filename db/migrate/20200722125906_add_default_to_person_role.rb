class AddDefaultToPersonRole < ActiveRecord::Migration[6.0]
  def change
    change_column_default :people, :role, from: nil, to: 0
  end
end
