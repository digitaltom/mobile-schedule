class TimetableController < ApplicationController

  caches_page :index


  def index
    cal_file = File.open("public/conference.ics")
    cals = Icalendar.parse(cal_file)
    @cal = cals.first

    @locations = @cal.events.map{|event| event.location}.uniq
    @dates = @cal.events.map{|event| event.dtstart}.sort.uniq
    

  end


end
