require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'

class Team
  attr_accessor :name, :team_players
  
  @@allteams = []
  
  def initialize
    @name = name
    @team_players = []
    @@allteams << self
  end
  
  def self.all_teams
    @@allteams
  end
end 

teams = {
  :trippingolney => 'http://baseball.fantasysports.yahoo.com/b1/16633/1',
  :emiliobonerfacio => 'http://baseball.fantasysports.yahoo.com/b1/16633/2',
  :fistyuinthebumgarner => 'http://baseball.fantasysports.yahoo.com/b1/16633/3',
  :paisanoscalzones => 'http://baseball.fantasysports.yahoo.com/b1/16633/4',
  :gentianswardrobe => 'http://baseball.fantasysports.yahoo.com/b1/16633/5',
  :whowantskimbrel => 'http://baseball.fantasysports.yahoo.com/b1/16633/6',
  :thefuturegentian => 'http://baseball.fantasysports.yahoo.com/b1/16633/7',
  :highonethier => 'http://baseball.fantasysports.yahoo.com/b1/16633/8',
  :adamjonesisblack => 'http://baseball.fantasysports.yahoo.com/b1/16633/9',
  :lincecumdumpster => 'http://baseball.fantasysports.yahoo.com/b1/16633/10',
  :lyanbruanmvp => 'http://baseball.fantasysports.yahoo.com/b1/16633/11',
  :thetroutsniffers => 'http://baseball.fantasysports.yahoo.com/b1/16633/12',
}

#looping through teams
teams.each do |team, team_url|
  @team = Team.new
  @team.name = team
  team_page = Nokogiri::HTML(open("#{team_url}"))
    players = team_page.css(".name").text
    players.gsub!(/([A-Z][^A-Z]+)/, '\1 ')
    players.gsub!(/(\.) ([A-Z]\.)/, '\1\2')
    players.gsub!(/(Mc|O') /, '\1')
    players.strip
    
   @team.team_players = players    
end

#Right now I have teams with a team_player array that consists of one string
#TODO split each teams string into an array of first name last names
#TODO save as first name/ last name objects for each team

