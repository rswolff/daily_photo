require 'test_helper'

class SubscriberMailerTest < ActionMailer::TestCase
  test "new_photo" do
    mail = SubscriberMailer.new_photo
    assert_equal "New photo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
