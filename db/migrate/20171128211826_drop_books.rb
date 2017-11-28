class DropBooks < ActiveRecord::Migration
  def up
    drop_table :books
  end

  def down
    create_table :books do |t|
      t.string :title, nil: false
      t.string :author, nil: false
    end
  end
end
