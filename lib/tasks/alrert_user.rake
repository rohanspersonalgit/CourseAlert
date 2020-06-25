require "textbot"
phone_number = "+12056228085"
namespace :alert_user do
  desc "TODO"
  task send_message: :environment do
    Textbot.send_message("lol", "+16048057254", phone_number)
  end
  

end
