require 'date'

class InputValidation
  def self.get_date(date)
    date = valid_date?(date) ? date : valid_date?(date)
    while date == false
      puts "\n\nPlease enter a valid date according to the format.".colorize(color: :yellow).bold
      puts 'Enter release date in the following format [dd/mm/yyyy]: '
      date = gets.chomp
      date = valid_date?(date) ? date : valid_date?(date)
    end
    date
  end

  def self.valid_date?(date)
    date_format = '%d/%m/%Y'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end
end
