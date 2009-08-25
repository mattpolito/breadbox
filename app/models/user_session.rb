class UserSession < Authlogic::Session::Base
  def welcome_message
    case
    when user.login_count > 1
      "Welcome back"
    when user.login_count = 1
      "Welcome, please take a look around!"
    end
  end
end