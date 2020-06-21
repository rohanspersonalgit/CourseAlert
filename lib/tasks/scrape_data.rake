require_relative '../course-scraper/lib/scraper.rb'
require_relative '../course-scraper/lib/users.rb'
scraper = Scraper.new()
test_course_1 = Course.new("CPSC", "410", "101" )
test_course_2 = Course.new("CPSC", "221", "101" )
test_course_3 = Course.new("COMM", "204", "101" )
test_user_1 = User.new("Rohan", [test_course_1,test_course_2,test_course_3])
namespace :scrape_data do
  desc "TODO"
  task get_course_data: :environment do
    scraper.batch_scrape_url([test_course_1,test_course_2,test_course_3])
  end

end
