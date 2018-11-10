require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Tag
  attr_reader :id
  attr_accessor :tag_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
  end

  def save()
    sql="INSERT INTO tags
    (
      tag_name
    )
      VALUES
      ($1)
      RETURNING id"
    values = [@tag_name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    tag = Tag.new(result)
    return tag
  end

end

# binding.pry
# nil
