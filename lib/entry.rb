require 'pg'

class Entry

  attr_reader :id, :title, :body
  
  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body
  end

  def self.all

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else
      connection = PG.connect(dbname: 'daily_diary')
    end

    result = connection.exec("SELECT * FROM entries;")
    result.map do |n_entry| 
      Entry.new(id: n_entry['id'],title: n_entry['title'], body: n_entry['body'])
    end
  end

  def self.add(title:, body:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else 
      connection = PG.connect(dbname: 'daily_diary')
    end

    result = connection.exec("INSERT INTO entries (title, body) VALUES ('#{title}', '#{body}') RETURNING id, title, body")
    Entry.new(id: result[0]['id'], title: result[0]['title'], body: result[0]['body'])
  end

  def self.last_entry
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'daily_diary_test')
    else 
      connection = PG.connect(dbname: 'daily_diary')
    end

    last_entry_result = connection.exec("SELECT * FROM entries WHERE id=(SELECT max(id) FROM entries)")
    
    title = last_entry_result.map { |entry| entry['title']}

    # performing logic here? to get last entry rather than doing it in erb file? 
  end
end