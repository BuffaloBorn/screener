class CreateAuthors < ActiveRecord::Migration
  def change


    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :books do |t|
      t.string :title, nil: false
      t.references :author
    end
  end
end
