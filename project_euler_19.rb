# Counting Sundays
# Problem 19
# You are given the following information, but you may prefer to do some research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

months = ['January', 'February', 'March', 'April', 'May', 'June', 'July',
  'August', 'September', 'October', 'November', 'December']

month_days = {'January' => 31, 'March' => 31, 'April' => 30, 'May' => 31, 'June' => 30,
  'July' => 31, 'August' => 31, 'September' => 30, 'October' => 31, 'November' => 30, 'December' => 31}

calendar = {}
current_weekday = nil

sundays = 0

(1900..2000).each do |year|
  calendar[year] = {}
  months.each do |month|
    calendar[year][month] = {}
    current_month_days = if month_days[month] == nil
      if year % 100 == 0
        year % 400 == 0 ? 29 : 28
      else
        year % 4 == 0 ? 29 : 28
      end
    else
      month_days[month]
    end
    (1..current_month_days).each do |day|
      current_weekday = if current_weekday == nil
        weekdays[0]
      else
        index = weekdays.index(current_weekday)
        if index == weekdays.size - 1
          weekdays[0]
        else
          weekdays[index + 1]
        end
      end
      # calendar[year][month][day] = current_weekday
      sundays += 1 if year >= 1901 && day == 1 && current_weekday == 'Sunday'
    end
  end
end

puts sundays
