class CreateCourseRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :course_roles do |t|
      t.string :type
      t.boolean :is_archived

      t.timestamps
    end
  end
end
