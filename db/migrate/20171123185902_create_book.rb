class CreateBook < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, nil: false
      t.string :author, nil: false
    end
  end
end
