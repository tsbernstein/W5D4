# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :course_id

  has_many :students,
    through: :enrollments,
    source:  :user

  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course
 
  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User
end

#Finally, add an instructor 
#association to Course. This will
#point to a User object. Note that
#Course is now related to User in
#two ways: instructor and 
#enrolled_students.

#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer # foreign key
#  instructor_id :integer # foreign key # 5
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#