require_relative '../course-scraper/lib/scraper.rb'
require_relative '../course-scraper/lib/users.rb'
require "textbot"
scraper = Scraper.new
Time.zone= 'Pacific Time (US & Canada)'
namespace :scrape_data do
  desc "TODO"
  task get_all_course_data_and_alert: :environment do
    logger = Rails.logger
    time_values = Time.new.to_a
    date = time_values[4].to_s + "_" + time_values[5].to_s + "_" + time_values[6].to_s
    CourseNotificaiton.find_each do |course|
      course_data = scraper.scrape_course(course.subject, course.course_name, course.section)
      course_name = course.subject + "_" + course.course_name + "_" + course.section 
      file_name = course_name + '_' + date
      if course_data["Total Seats Remaining"] != "0"
        message = course_data["Total Seats Remaining"] + " "+ "Total Seats Remaining in " + course_name
        course.phonenumbers.each do |number|
          Textbot.send_message(message, number, phone_number)
        end
        logger.info(phone_number + "alerted at " + Time.zone.now.strftime('%m/%d/%Y %H:%M %p') + " about " + course_name + "\n")
      else
        logger.info("checked at " + Time.zone.now.strftime('%m/%d/%Y %H:%M %p') + "\n") 
      end
    end
  end
  
  desc "lol"
  task get_courses_to_scrape: :environment do
    CourseNotificaiton.find_each do |course|
      puts(course.section)
    end
  end

end
