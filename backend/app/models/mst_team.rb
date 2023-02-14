# frozen_string_literal: true

#
# チームマスタ
#
class MstTeam < FourKeysBase
  self.table_name = 'mst_team'
  self.primary_key = 'mte_team_id'

  before_save :set_time_stamps

  private

  def set_time_stamps
    dt = Time.current
    self.mte_registration_datetime = dt if new_record?
    self.mte_update_datetime = dt if has_changes_to_save?
  end
end
