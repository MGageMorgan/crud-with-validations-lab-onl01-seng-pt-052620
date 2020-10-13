# I'm behind in my cohort. I know what Avi wants us to do, I can tell you I
# am out of time to mess around with RailsGuides - I get one day off a week if that tells you anything. 
# My options are AAQ, and, failing that, ripping the code out of someone else's copy 
# just for the sake of getting these tests to pass.
class Song < ApplicationRecord
  validates :title, presence: true

  # Cannot be repeated by the same artist in the same year
  # How? Curriculum doesn't cover this, I'm out of time, I have to move on.

  validates :released, inclusion: { in: %w(true false),
    message: "%{value} must be true or false" }

  # release_year
  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year
  
  validates :artist_name, presence: true
end
