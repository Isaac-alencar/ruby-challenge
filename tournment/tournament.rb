# frozen_string_literal: true

# Tournament
class Tournament
  class << self
    def tally(input)
      teams = Teams.new(input)
      "#{tally_table_head}#{teams.call.each(&:to_s).join('')}"
    end

    private

    def tally_table_head
      "#{'Team'.ljust(31)}| MP |  W |  D |  L |  P\n"
    end
  end
end

# Team
class Team
  POINTS_RULE = {
    win: 3,
    draw: 1,
    lose: 0
  }.freeze

  attr_accessor :name,
                :wins_count,
                :draws_count,
                :loses_count

  def initialize(name)
    @name = name
    @wins_count = 0
    @draws_count = 0
    @loses_count = 0
  end

  def to_s
    "| #{matches_played.to_s.rjust(2)} | " \
      "#{@wins_count.to_s.rjust(2)} | " \
      "#{@draws_count.to_s.rjust(2)} | " \
      "#{@loses_count.to_s.rjust(2)} | " \
      "#{points.to_s.rjust(2)}"
  end

  def win
    @wins_count += 1
  end

  def lose
    @loses_count += 1
  end

  def draw
    @draws_count += 1
  end

  def points
    @draws_count * POINTS_RULE[:draw] + @wins_count * POINTS_RULE[:win]
  end

  def matches_played
    @draws_count + @wins_count + @loses_count
  end
end

# Teams
class Teams
  def initialize(input)
    @teams = []
    @input = input
  end

  def call
    table(@input)
  end

  private

  def table(input)
    mathces_data = input.split("\n")

    mathces_data.each do |data|
      team, opponent, result = data.split(';')

      team_a = select_team(name: team)
      team_b = select_team(name: opponent)

      match(result:, team_a:, team_b:)
    end

    create_game_table
  end

  def select_team(name:)
    selected_team = @teams.find { |team| team.name == name }

    if selected_team.nil?
      selected_team = Team.new(name)
      @teams << selected_team
    end

    selected_team
  end

  def match(result:, team_a:, team_b:)
    case result
    when 'win'
      team_a.win
      team_b.lose
    when 'loss'
      team_a.lose
      team_b.win
    when 'draw'
      team_a.draw
      team_b.draw
    end
  end

  def create_game_table
    @teams.sort_by { |team| [-team.points, team.name] }
          .map { |team| "#{team.name.ljust(31)}#{team}\n" }
  end
end
