# frozen_string_literal: true

module Api
  module V1
    class ReleaseController < ApplicationController
      def index
        releases = MstGitHubRelease.all
        render json: {result: releases}
      end
    end
  end
end