class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.to_xls options = {}
    CSV.generate options do |csv|
      csv << column_names
      all.find_each do |c|
        csv << c.attributes.values_at(*column_names)
      end
    end
  end
end
