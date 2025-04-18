require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "has_todos" do
    mail = UserMailer.has_todos
    assert_equal "Has todos", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
