require_relative './lib/scraper.rb'
require_relative './lib/users.rb'


test_course_1 = Course.new("CPSC", "410", "101" )
test_course_2 = Course.new("CPSC", "221", "101" )
test_course_3 = Course.new("COMM", "204", "101" )
scraper = Scraper.new()
test_user_1 = User.new("Rohan", [test_course_1,test_course_2,test_course_3])
puts test_user_1
scraper.batch_scrape_url([test_course_1,test_course_2,test_course_3])