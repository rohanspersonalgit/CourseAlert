class CreateCourseNotificaitons < ActiveRecord::Migration[6.0]
  def change
    create_table :course_notificaitons do |t|
      t.string :subject
      t.string :course_name
      t.string :section
      t.text :phonenumbers

      t.timestamps
    end
  end
end
