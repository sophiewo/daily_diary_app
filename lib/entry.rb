require 'pg'

class Entry
  
  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else
      connection = PG.connect(dbname: 'daily_diary')
    end

    result = connection.exec("SELECT * FROM entries;")
    result.map {|entry| entry['title']}
  end

  def self.add(title:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else 
      connection = PG.connect(dbname: 'daily_diary')
    end

    connection.exec("INSERT INTO entries (title) VALUES ('#{title}')")
  end

  def self.last_entry
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else 
      connection = PG.connect(dbname: 'daily_diary')
    end

    last_entry_result = connection.exec("SELECT * FROM entries WHERE id=(SELECT max(id) FROM entries)")
    
    last_entry_result.map { |entry| entry['title']}
   
    # performing logic here? to get last entry rather than doing it in erb file? 
  end
end