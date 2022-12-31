# == Schema Information
#
# Table name: projects
#
#  id          :uuid             not null, primary key
#  description :text             default(""), not null
#  name        :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
    has_many :comments, dependent: :destroy, class_name: "Comment", foreign_key: "project_id"
    accepts_nested_attributes_for :comments
end
