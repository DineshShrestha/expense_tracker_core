defmodule ExpenseTrackerServer do 
    use GenServer
    alias ExpenseTrackerCore, as: Core
    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    @impl true
    def init(:ok) do
        {:ok, Core.new()}
    end
end
