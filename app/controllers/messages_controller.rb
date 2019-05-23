class MessagesController < ApplicationController

	def create
		@message = Message.new(message_params)

		if @message.save
			redirect_to matches_show_path(@message.matching_id)
		else
			redirect_to matches_show_path(@message.matching_id), notice: @message.errors.full_messages.last
		end
	end

	private
	def message_params
		params.require(:message).permit(:matching_id, :text, :speaker_id)
	end
end
