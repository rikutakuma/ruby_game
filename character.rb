require './message_dialog'

class Character

	include MessageDialog
	attr_reader :offence, :defence
	attr_accessor :hp, :name

	def initialize(**params)
		@name = params[:name]
		@hp = params[:hp]
		@offence = params[:offence]
		@defence = params[:defence]
	end
end