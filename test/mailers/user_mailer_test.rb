require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "send_login_link" do
    mail = UserMailer.send_login_link
    assert_equal "Send login link", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
