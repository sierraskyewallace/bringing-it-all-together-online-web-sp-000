class Dog 
  attr_accessor :id, :name, :breed 
  
  def initialize(name:, breed:, id:)
    @name = name
    @breed = breed
    @id = id 
  end
  
  def self.create_table
    sql = <<-SQL 
    CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY, 
    name TEXT,
    breed TEXT)
    SQL
    DB[:conn].execute(sql, name:, breed:)
  end
  
end 
