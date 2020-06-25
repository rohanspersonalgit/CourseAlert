require_relative '../course-scraper/lib/scraper.rb'
require_relative '../course-scraper/lib/users.rb'
require "textbot"
scraper = Scraper.new
namespace :scrape_data do
  desc "TODO"
  task get_all_course_data_and_alert: :environment do
    courses = []
    CourseNotificaiton.find_each do |course|
      course_data = scraper.scrape_course(course.subject, course.course_name, course.section)

      if course_data["Total Seats Remaining"] != "0"
        message = course_data["Total Seats Remaining"] + " "+ "Total Seats Remaining in " + course.subject + " " + course.course_name + " " + course.section 
        Textbot.send_message(message, "+16048057254", phone_number)
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
