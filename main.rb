class Brave

	attr_reader :name, :offence, :defence
	attr_accessor :hp

	SPECIAL_ATTACK_CONSTANT = 1.5

	def initialize(**params)
		@name = params[:name]
		@hp = params[:hp]
		@offence = params[:offence]
		@defence = params[:defence]
	end

	def attack(monster)
		puts "#{@name}の攻撃"

		attack_num = rand(4)

		if attack_num == 0
			puts "必殺攻撃"
			damage = calculate_special_attack - monster.defence
		else
			puts "通常攻撃"
			damage = @offence - monster.defence
		end

		monster.hp -= damage

		puts "#{monster.name}は#{damage}のダメージを受けた"
		puts "#{monster.name}の残りHPは#{monster.hp}だ"
	end

	def calculate_special_attack
		@offence * SPECIAL_ATTACK_CONSTANT
	end

end

class Monster

	attr_reader :offence, :defence
	attr_accessor :hp, :name

	POWER_UP_RATE = 1.5
	CALC_HALF_HP = 0.5

	def initialize(**params)
		@name = params[:name]
		@hp = params[:hp]
		@offence = params[:offence]
		@defence = params[:defence]
		@transform_flag = false
		@trigger_of_transform = params[:hp] * CALC_HALF_HP
	end

	def attack(brave)
		if @hp <= @trigger_of_transform && @transform_flag == false
			@transform_flag = true
			transform
		end

		puts "#{@name}の攻撃"

		damage = @offence - brave.defence

		brave.hp -= damage

		puts "#{brave.name}は#{damage}のダメージを受けた"
		puts "#{brave.name}の残りHPは#{brave.hp}だ"

	end

	private

	def transform
		transform_name = "ドラゴン"

		puts <<~EOS
		#{@name}は怒っている
		#{@name}は#{transform_name}に変身した
		EOS

		@offence *= POWER_UP_RATE
		@name = transform_name

	end


end

brave = Brave.new(name: "テリー", hp: 500, offence: 150, defence: 100)
monster = Monster.new(name: "スライム", hp: 250, offence: 200, defence: 100)

brave.attack(monster)
monster.attack(brave)
