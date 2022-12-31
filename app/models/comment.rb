# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  body       :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :uuid             not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Comment < ApplicationRecord
  belongs_to :project, class_name: "Project", foreign_key: "project_id"
  include ActionView::RecordIdentifier
  has_rich_text :body

  after_create_commit { broadcast_prepend_to [project, :comments], target: "#{dom_id(project)}_comments" }
end
