## broken solid principle hint (in hex):  DIP

## Original code:
##
##  class MySQLDatabase
##    def connect
##      puts "Connected to MySQL"
##    end
##  end
##
##  class DataFetcher
##    def initialize
##      @db = MySQLDatabase.new
##    end
##
##    def fetch_data
##      @db.connect
##     # fetch logic here
##    end
##  end
##

###########################################################
###########################################################
###########################################################
##
## refactored code addresses the following:
##
## DIP: High-level class (DataFetcher) no longer depends on a 
##      specific low-level module (MySQLDatabase). Instead, it 
##      depends on an abstraction. This allows you to swap 
##      in PostgresDatabase, SQLite, 
##      or even a mock without changing DataFetcher.
##      
##      
##      
##
###########################################################
###########################################################

class Database
  def connect
    raise NotImplementedError, "Subclasses must implement `connect`"
  end
end

class MySQLDatabase < Database
  def connect
    puts "Connected to MySQL"
  end
end

class PostgresDatabase < Database
  def connect
    puts "Connected to PostgreSQL"
  end
end

class Magic8BallDatabase < Database
  RESPONSES = [
    "Its in there somewhere i'll keep looking",
    "Ask again later",
    "Don't count on it",
    "Could be this, could be that",
  ]

  def connect
    puts "Shaking Magic 8 Ball..."
  end

  def query(_)
    puts RESPONSES.sample
  end
end

class DataFetcher
  def initialize(db)
    @db = db
  end

  def fetch_data
    @db.connect
    puts "Fetching data..."
  end
end

# Example usage:
fetcher1 = DataFetcher.new(MySQLDatabase.new)
fetcher1.fetch_data

fetcher2 = DataFetcher.new(PostgresDatabase.new)
fetcher2.fetch_data
