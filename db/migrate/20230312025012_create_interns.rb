class CreateInterns < ActiveRecord::Migration[6.0]
  def change
    create_table :interns do |t|
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.integer :year
      t.string :major
      t.string :university

      t.timestamps
    end
  end
end
