require 'pg'

class Peep

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end
    
    result = connection.exec("SELECT * FROM peep_messages;")
    result.map { |peep| peep['message'] }
  end

end