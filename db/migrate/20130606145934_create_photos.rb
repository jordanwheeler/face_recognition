class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :pid
      t.string :tid
      t.string :uids

      t.timestamps
    end
  end
end
