require 'twilio-ruby'
require './config/environment'
module Textbot
    

    # Your Test Account SID from www.twilio.com/console/settings
    auth_token = Rails.application.credentials.twillio[:auth_token]   # Your Test Auth Token from www.twilio.com/console/settings
    account_sid = Rails.application.credentials.twillio[:account_sid] 
    @client = Twilio::REST::Client.new account_sid, auth_token

    # class Textbot
    #     def initilize()
    #     end
    #     def send_message(message, to)
    #         tosend = @client.messages.create(
    #             body: message,
    #             to: to,    # Replace with your phone number
    #             from: phone_number)  # Use this Magic Number for creating SMS
    #     end
    # end
    # t = Textbot.new()
    # t.send_message("lol", "+16048057254")

    def Textbot.send_message(message, to, phone_number)
        tosend = @client.messages.create(
            body: message,
            to: to,    # Replace with your phone number
            from: phone_number)  # Use this Magic Number for creating SMS
    end
end