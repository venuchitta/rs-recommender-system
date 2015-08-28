require 'csv_data_importer'

namespace :app do
  desc "Import data from csv files to database"
  task :import_csv_data => :environment do
    CSVDataImporter.new.import
  end
end
