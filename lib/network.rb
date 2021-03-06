class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    @shows.reduce do |show|
      show.characters.filter do |character|
        upcase = character.name == character.name.upcase
        paid = character.salary > 500_000
        upcase && paid
      end
    end
  end

  def actors_by_show
    hash = {}
    @shows.each do |show|
      actors = show.characters.map do |character|
        character.actor
      end
      hash[show] = actors
    end
    hash
  end

  # look at actors by show and get that info out
  def shows_by_actor
    hash = {}
    @shows.each do |show|
      hash = show.characters.group_by do |character|
        character.actor
      end
    end
    hash
  end

end
