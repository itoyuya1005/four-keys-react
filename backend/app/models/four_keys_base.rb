# frozen_string_literal: true

#
# FourKeysデータベース
#
class FourKeysBase < ApplicationRecord
  self.abstract_class = true
  establish_connection('four_keys_development'.to_sym)
end