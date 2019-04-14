class Dog 
  attr_accessor :name, :breed, :id
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql =  <<-SQL
      DROP TABLE dogs
        SQL
    DB[:conn].execute(sql)
  end
  
  def self.new_from_db(row)
    Dog.new({id: row[0], name: row[1], breed; row[2]})
  end

end