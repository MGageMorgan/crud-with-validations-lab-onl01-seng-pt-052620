# Ruby files can support more than one class, and I'm lazy
# class CurrentYearValidator < ActiveModel::Validator
#   def validate(record)
#     current_year = DateTime.now.year
#     if record.release_year > current_year
#       record.errors[:release_year] << 'Year cannot be in the future!'
#     end
#   end
# end

class Song < ApplicationRecord
  # validate :release_year_cannot_be_in_future

  # def release_year_cannot_be_in_future
  #   current_year = DateTime.now.year
  #   if self.release_year > current_year
  #     errors.add(:release_year, "Year cannot be in the future!")
  #   end
  # end

  # include ActiveModel::Validations
  # validates_with CurrentYearValidator

  validates :title, presence: true

  # Cannot be repeated by the same artist in the same year
  validates :title, uniqueness: { scope: :released,
    message: "Cannot be repeated by the same artist in the same year" }

  validates :released, inclusion: { in: %w(true false),
    message: "%{value} must be true or false" }

  # release_year
  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year
  current_year = DateTime.now.year
  with_options if: :released == true && :release_year < current_year do |release|
    release.validates :release_year, presence: true
  end
  
  validates :artist_name, presence: true
end
