# Be sure to restart your server when you modify this file.
#
# This file eases your Rails 7.2 framework defaults upgrade.
#
# Uncomment each configuration one by one to switch to the new default.
# Once your application is ready to run with all new defaults, you can remove
# this file and set the `config.load_defaults` to `7.2`.
#
# Read the Guide for Upgrading Ruby on Rails for more info on each option.
# https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

###
# Enable validation of migration timestamps. When set, an ActiveRecord::InvalidMigrationTimestampError
# will be raised if the timestamp prefix for a migration is more than a day ahead of the timestamp
# associated with the current time. This is done to prevent forward-dating of migration files, which can
# impact migration generation and other migration commands.
#
# Applications with existing timestamped migrations that do not adhere to the
# expected format can disable validation by setting this config to `false`.
#++
Rails.application.config.active_record.validate_migration_timestamps = true

###
# Controls whether the PostgresqlAdapter should decode dates automatically with manual queries.
#
# Example:
#   ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.select_value("select '2024-01-01'::date") #=> Date
#
# This query used to return a `String`.
#++
Rails.application.config.active_record.postgresql_adapter_decode_dates = true

###
# Enables YJIT as of Ruby 3.3, to bring sizeable performance improvements. If you are
# deploying to a memory constrained environment you may want to set this to `false`.
#++
# Rails.application.config.yjit = true
