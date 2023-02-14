# frozen_string_literal: true

#
# プロジェクトマスタ
#
class MstProject < FourKeysBase
  self.table_name = 'mst_project'
  self.primary_key = 'mpr_project_id'

  has_many :git_hub_releases, foreign_key: 'mgr_project_id'

  before_save :set_time_stamps

  private

  def set_time_stamps
    dt = Time.current
    self.mpr_registration_datetime = dt if new_record?
    self.mpr_update_datetime = dt if has_changes_to_save?
  end
end
