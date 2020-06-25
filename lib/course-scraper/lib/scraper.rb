require 'httparty'
require 'nokogiri'
Course = Struct.new(:subject, :course, :section)
class Scraper

attr_accessor :parse_page

    def initilize()

    end

    def batch_scrape_url(courses)
        course_data = []
        for course in courses do
            data = scrape_url(get_url(course[:subject], course[:course], course[:section]))
            course_data.push(data)
        end
        puts data
    end

    def scrape_course(subject, course, section)
        data = scrape_url(get_url(subject,course,section))
        puts(data)
        return data
    end

    def scrape_url(url)
        doc = HTTParty.get(url).body
        parse_page ||= Nokogiri::HTML(doc)
        table = parse_page.xpath("/html/body/div[2]/div[4]/table[4]")
        return parse_table(table)
    end

    def get_url(subject, course, section)
        return "https://courses.students.ubc.ca/cs/courseschedule?pname=subjarea&tname=subj-section&dept=#{subject}&course=#{course}&section=#{section}"
    end
    def scrape_courses(courses)
        # implement get all courses
    end
    def parse_table(table)
        rows = table.css('tr')
        seat_info_rows = rows[0..3]
        seat_info_rows = seat_info_rows.map(&:text)
        seat_data = {}
        for row in seat_info_rows do
            row = row.split(":")
            seat_data[row[0]] = row[1]
        end
        p(seat_data)
        return seat_data
    end

end


