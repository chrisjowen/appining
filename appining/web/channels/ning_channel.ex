defmodule Appining.NingChannel do
  use Phoenix.Channel
  require Logger

  def join("ning:events", _message, socket) do
    Logger.info("Joining channel events #{inspect(socket.channel_pid)}")
    {:ok, socket}
  end

  def join("ning:" <> id, _params, socket) do
    Logger.info("Joining channel #{id} #{inspect(socket.channel_pid)}")
    {:ok, socket}
  end

  def handle_in("msg:new:text", message, socket) do
    Logger.info("Recieved message #{inspect(message)} #{inspect(socket.channel_pid)}")
    broadcast! socket, "msg:new:text", Map.merge(%{topic: socket.topic}, message)
    {:noreply, socket}
  end

end
