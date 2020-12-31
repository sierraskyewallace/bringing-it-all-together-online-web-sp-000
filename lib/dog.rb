class Dog 
  attr_accessor :id, :name, :breed 
  
  def initialize(name, breed, id=nil)
    @name = name
    @breed = breed
    @id = id 
  end
  
  def self.create_table
    sql = <<-SQL 
    CREATE TABLE IF NONE EXISTS dogs (id )
end 
