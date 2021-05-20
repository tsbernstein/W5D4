# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :student_id

  # belongs_to :enrollment,
  #   primary_key: :id,
  #   foreign_key: :student_id,
  #   class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments, #line 12 of user
    source: :course #line 13 of enrollment
end
