class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.to_xls(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end
end
