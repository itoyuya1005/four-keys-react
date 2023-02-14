# frozen_string_literal: true

#
# GitHubリリースマスタ
#
class MstGitHubRelease < FourKeysBase
  self.table_name = 'mst_git_hub_release'
  self.primary_key = 'mgr_git_hub_release_id'

  before_save :set_time_stamps

  has_one :undeleted_release, -> { where(tre_delete_flag: '0') }, class_name: 'FourKeys::TrxRelease', foreign_key: 'tre_git_hub_release_id'
  belongs_to :mst_project, foreign_key: 'mgr_project_id'

  private

  def set_time_stamps
    dt = Time.current
    self.mgr_registration_datetime = dt if new_record?
    self.mgr_update_datetime = dt if has_changes_to_save?
  end
end
