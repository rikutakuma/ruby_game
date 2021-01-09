class GamesController

EXP_CONSTANT = 2
GOLD_CONSTANT = 3

def battle(**params)
	brave = params[:brave]
	monster = params[:monster]

	loop do
		brave.attack(monster)
		break if battle_end?(monster)
		monster.attack(brave)
		break if battle_end?(brave)
	end

	if battle_result(brave)
		result = calculate_of_exp_and_gold(monster)
		puts "#{brave.name}はたたかいに勝った"
		puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
	else
		puts "#{brave.name}はたたかいに負けた"
		puts "目の前が真っ暗になった"
	end
end

private

def battle_end?(charaster)
	character.hp <= 0
end

def battle_result(brave)
	brave.hp > 0
end


def calculate_of_exp_and_gold(monster)
	exp = (monster.offence + monster.defence)*EXP_CONSTANT
	gold = (monster.offence + monster.defence)*GOLD_CONSTANT
	result = {exp: exp, gold: gold}

	result
end

end
