class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :picture, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
