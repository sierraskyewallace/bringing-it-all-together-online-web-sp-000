class Dog 
  attr_accessor :name, :breed
  attr_reader :id

  
  def initialize(id:, name:, breed:)
    @id = id
    @name = name
    @breed = breed
  end
  
  def self.create_table
    sql = <<-SQL 
    CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY, 
    name TEXT,
    breed TEXT)
    SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS dogs
      SQL

     DB[:conn].execute(sql) 
  end
  
  def self.new_from_db(row)
        Dog.new(id: row[0],name: row[1], breed: row[2])
  end
  
  def self.create(name:, breed:)
    dog = Dog.new(name, breed)
    dog.save
    dog
  end
  
  def save 
    if self.id 
      self.update 
    else 
      sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
  end
  
   def self.find_by_id(id)
 end
  
  
  
end 
