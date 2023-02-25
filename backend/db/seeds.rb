# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }{ name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seedファイルの先頭に以下のコードを追加
# TODO：木原さんに聞く
ActiveRecord::Base.connection.execute("USE four_keys")

MstOrganization.create!({ mor_organization_name: 'プロダクト企画部',
                           mor_git_hub_app_id: 265170,
                           mor_git_hub_app_secret_key: 'secreat',
                           mor_registration_datetime: Time.current,
                           mor_update_datetime: Time.current,
                           mor_update_timestamp: Time.current})

MstTeam.create!({ mte_organization_id: 1,
                     mte_team_name: 'Kdev',
                     mte_registration_datetime: Time.current,
                     mte_update_datetime: Time.current,
                     mte_update_timestamp: Time.current })
MstTeam.create!({ mte_organization_id: 1,
                  mte_team_name: 'Mdev',
                  mte_registration_datetime: Time.current,
                  mte_update_datetime: Time.current,
                  mte_update_timestamp: Time.current })
MstTeam.create!({ mte_organization_id: 1,
                  mte_team_name: 'Tdev',
                  mte_registration_datetime: Time.current,
                  mte_update_datetime: Time.current,
                  mte_update_timestamp: Time.current })
