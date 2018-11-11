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

  def self.all()
    sql = "SELECT * FROM tags"
    tag_data = SqlRunner.run(sql)
    tags = map_items(tag_data)
    return tags
  end

  def self.map_items(tag_data)
    return tag_data.map { |tag| Tag.new(tag) }
  end

  def update()
    sql = "UPDATE tags
    SET tag_name = $1
    WHERE id = $2"
    values = [tag_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

# binding.pry
# nil
