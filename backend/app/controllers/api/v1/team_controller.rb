# frozen_string_literal: true

module Api
  module V1
    class TeamController < ApplicationController
      def index
        teams = MstTeam.all
        render json: { teams: teams }, status: 200
      end
      
      def create
        # MstOrganization.create!({ mor_organization_name: 'プロダクト企画部',
        #                           mor_git_hub_app_id: 265170,
        #                           mor_git_hub_app_secret_key: 'secreat',
        #                           mor_registration_datetime: Time.current,
        #                           mor_update_datetime: Time.current,
        #                           mor_update_timestamp: Time.current})
        # mor = MstOrganization.find(2)
        # MstTeam.create!({ mte_organization_id: mor.mor_organization_id,
        #                   mte_team_name: 'Kdev',
        #                   mte_registration_datetime: Time.current,
        #                   mte_update_datetime: Time.current,
        #                   mte_update_timestamp: Time.current })
        # MstTeam.create!({ mte_organization_id: mor.mor_organization_id,
        #                   mte_team_name: 'Mdev',
        #                   mte_registration_datetime: Time.current,
        #                   mte_update_datetime: Time.current,
        #                   mte_update_timestamp: Time.current })
        # MstTeam.create!({ mte_organization_id: mor.mor_organization_id,
        #                   mte_team_name: 'Tdev',
        #                   mte_registration_datetime: Time.current,
        #                   mte_update_datetime: Time.current,
        #                   mte_update_timestamp: Time.current })
        teams = MstTeam.all
        render json: { teams: teams }, status: 200
      end
    end
  end
end