require_relative '../course-scraper/lib/scraper.rb'
require_relative '../course-scraper/lib/users.rb'
scraper = Scraper.new()
namespace :scrape_data do
  desc "TODO"
  task get_course_data: :environment do
    courses = []
    CourseNotificaiton.find_each do |course|
      scraper.scrape_course(course.subject, course.course_name, course.section)
    end
  end
  
  desc "lol"
  task get_courses_to_scrape: :environment do
    CourseNotificaiton.find_each do |course|
      puts(course.section)
    end
  end

end
