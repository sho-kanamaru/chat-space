class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat:message'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def put_message(data) #ここが変わった
    ChatChannel.broadcast_to('message', data['message']) #ここが変わった
  end
end
