require 'pg'

class Entry
  
  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else
      connection = PG.connect(dbname: 'daily_diary')
    end

    result = connection.exec("SELECT * FROM entries;")
    result. map { |entry| entry['title']}

  end
end