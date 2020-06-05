require 'entry'

describe Entry do

  describe '.all' do
    it 'shows all my diary entries' do
      connection = PG.connect(dbname: 'daily_diary_test')

      #test data
      connection.exec("INSERT INTO entries (id, title) VALUES (1, 'My first entry');")
      connection.exec("INSERT INTO entries (id, title) VALUES (2, 'My second entry');")
      connection.exec("INSERT INTO entries (id, title) VALUES (3, 'My third entry');")



      entries = Entry.all

      expect(entries).to include "My first entry"
      expect(entries).to include "My second entry"
      expect(entries).to include "My third entry"


    end
  end
end


#test for hash straight away?