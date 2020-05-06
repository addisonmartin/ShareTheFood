class InstallSomePostgresExtensions < ActiveRecord::Migration[6.0]
  def up
    safety_assured do
      execute "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
      execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;"
      execute "CREATE EXTENSION IF NOT EXISTS unaccent;"

    end
  end

  def down
    safety_assured do
      execute "DROP EXTENSION IF EXISTS pg_trgm;"
      execute "DROP EXTENSION IF EXISTS fuzzystrmatch;"
      execute "DROP EXTENSION IF EXISTS unaccent;"
    end
  end
end
