require './brave'
require './monster'
require './games_controller'

games_controller = GamesController.new

terry = Brave.new(name: "テリー", hp: 500, offence: 150, defence: 100)
slime = Monster.new(name: "スライム", hp: 250, offence: 200, defence: 100)

games_controller.battle(brave: terry, monster: slime)












