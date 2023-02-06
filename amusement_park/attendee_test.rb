# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'attendee'

# AttendeeTest
class AttendeeTest < MiniTest::Test
  def new_instance_doesnt_have_pass
    refute Atendee.new(100).has_pass?
  end

  def test_if_an_attendee_fits_a_ride
    assert Attendee.new(140).fits_ride?(100)
  end

  def test_if_an_attendee_is_allowed_to_ride
    # skip
    attendee = Attendee.new(100)
    attendee.issue_pass!(42)

    refute attendee.allowed_to_ride?(120)
  end

  def test_when_issued_pass
    # skip
    attendee = Attendee.new(100)
    attendee.issue_pass!(42)

    assert_equal 42, attendee.pass_id
  end

  def test_when_revoked_doesnt_have_pass
    # skip
    attendee = Attendee.new(100)
    attendee.issue_pass!(42)
    attendee.revoke_pass!

    refute attendee.pass_id
  end

  def test_has_pass
    refute Attendee.new(100).has_pass?
  end
end
