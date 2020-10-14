# Enjoy the carnage of "reading the docs" here! I've compiled everything that's failed
# just from reading the RailsGuides

# Ruby files can support more than one class, and I'm lazy
# class CurrentYearValidator < ActiveModel::Validator
#   def validate(record)
#     current_year = DateTime.now.year
#     if record.release_year > current_year
#       record.errors[:release_year] << 'Year cannot be in the future!'
#     end
#   end
# end

# validate :release_year_cannot_be_in_future

# def release_year_cannot_be_in_future
#   current_year = DateTime.now.year
#   if self.release_year > current_year
#     errors.add(:release_year, "Year cannot be in the future!")
#   end
# end

# include ActiveModel::Validations
# validates_with CurrentYearValidator

# validates :released, inclusion: { in: %w(true false),
#   message: "%{value} must be true or false" }

# with_options if: :released == true do |release|
#   release.validates :release_year, presence: true, numericality: { less_than_or_equal_to: current_year }
# end

class Song < ApplicationRecord
  validates :title, presence: true
  
  validates :title, uniqueness: { scope: :released,
    message: "Cannot be repeated by the same artist in the same year" }
  
  validates :released, inclusion: { in: [true, false] } 
  
  current_year = DateTime.now.year
  validates :release_year, numericality: { less_than_or_equal_to: current_year }, if: :released?
  
  validates :artist_name, presence: true
end
