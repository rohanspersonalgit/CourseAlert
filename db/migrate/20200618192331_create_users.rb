class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :courses, array:true, default:[]

      t.timestamps
    end
  end
end
