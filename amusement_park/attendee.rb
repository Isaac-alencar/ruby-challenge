# frozen_string_literal: true

# Attendee
class Attendee
  attr_reader :pass_id

  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Do not edit above methods, add your own methods below.

  def has_pass?
    @pass_id
  end

  def fits_ride?(ride_minimum_height)
    ride_minimum_height <= @height
  end

  def allowed_to_ride?(ride_minimum_height)
    @issue_pass && fits_ride?(ride_minimum_height)
  end
end
