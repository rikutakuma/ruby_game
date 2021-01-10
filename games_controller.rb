require './message_dialog'

class GamesController

	include MessageDialog

	EXP_CONSTANT = 2
	GOLD_CONSTANT = 3

	def battle(**params)
		build_characters(params)

		loop do
			@brave.attack(@monster)
			break if battle_end?
			@monster.attack(@brave)
			break if battle_end?
		end

		battle_judgment
	end

	private

	def build_characters(**params)
		@brave = params[:brave]
		@monster = params[:monster]
	end

	def battle_end?
		@brave.hp <= 0 || @monster.hp <= 0
	end

	def brave_win?
		@brave.hp > 0
	end

	def battle_judgment
		#if brave_win?
		result = calculate_of_exp_and_gold
		# 	puts "#{@brave.name}はたたかいに勝った"
		# 	puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
		#else
		# 	puts "#{@brave.name}はたたかいに負けた"
		# 	puts "目の前が真っ暗になった"
		#end
		end_message(result)
	end

	def calculate_of_exp_and_gold
		if brave_win?
			brave_win_flag = true
			exp = (@monster.offence + @monster.defence)*EXP_CONSTANT
			gold = (@monster.offence + @monster.defence)*GOLD_CONSTANT
		else
			brave_win_flag = false
			exp = 0
			gold = 0
		end
		{brave_win_flag: brave_win_flag, exp: exp, gold: gold}

	end

end
