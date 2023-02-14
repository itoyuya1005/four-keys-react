# frozen_string_literal: true

#
# 組織マスタ
#
class MstOrganization < FourKeysBase
  self.table_name = 'mst_organization'
  self.primary_key = 'mor_organization_id'

  before_save :set_time_stamps

  ID_PROKI = 1

  private

  def set_time_stamps
    dt = Time.current
    self.mor_registration_datetime = dt if new_record?
    self.mor_update_datetime = dt if has_changes_to_save?
  end
end
