## if you want a hint for what principles are broken
## decode the following hex strings
#
# 44 49 50


class MySQLDatabase
  def connect
    puts "Connected to MySQL"
  end
end

class DataFetcher
  def initialize
    @db = MySQLDatabase.new
  end

  def fetch_data
    @db.connect
    # fetch logic here
  end
end

