class CreateEventoAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :evento_admins do |t|
      t.references :comuna, foreign_key: true
      t.text :url
      t.text :descripcion
      t.string :photo
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
