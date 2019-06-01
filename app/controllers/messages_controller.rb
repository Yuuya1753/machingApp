class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)

		if @message.save
			redirect_to matches_show_path(@message.matching_id)
		else
			redirect_to matches_show_path(@message.matching_id), notice: @message.errors.full_messages.last
		end
	end

	def count_message
		@count = Message.where('id > ? and matching_id = ?', params[:message_id], params[:matching_id]).size
		p @count
		return @count
	end

	private
	def message_params
		params.require(:message).permit(:matching_id, :text, :speaker_id)
	end
end
