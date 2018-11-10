require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Tag
  attr_reader :id
  attr_accessor :tag_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @tag_name = options['tag_name']
  end

end

# binding.pry
# nil
