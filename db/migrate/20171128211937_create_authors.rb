class CreateAuthors < ActiveRecord::Migration
  def change


    create_table :authors do |t|
      t.string :f_name
      t.string :l_name

      t.timestamps
    end

    create_table :books do |t|
      t.string :title, nil: false
      t.references :authors
    end
  end
end
