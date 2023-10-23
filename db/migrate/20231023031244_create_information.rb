class CreateInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :information do |t|
      t.string :email
      t.string :pass

      t.timestamps
    end
  end
end
