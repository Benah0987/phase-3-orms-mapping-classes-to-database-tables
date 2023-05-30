class Song

  attr_accessor :name, :album

  def initialize(name:, album:)
    @name = name
    @album = album
  end
  
# creating a table
  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS songs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
      )
      SQL
    DB[:conn].execute(sql)

# # adding a new song to the database
    def save
      sql = <<-SQL
        INSERT INTO songs (name, album)
        VALUES (?, ?)
      SQL
  
      DB[:conn].execute(sql, self.name, self.album)
  
    end
  end


end
