require 'pg'

def setup_test_database
  p 'Set up database'

  connection = PG.connect(dbname: 'daily_diary_test')

  connection.exec("TRUNCATE entries;")

end