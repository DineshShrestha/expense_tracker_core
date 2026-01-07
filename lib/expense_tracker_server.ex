defmodule ExpenseTrackerServer do 
    use GenServer
    alias ExpenseTrackerCore, as: Core
    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__, :ok, opts)
    end

    def add_expense(pid, title, amount, category) do
        GenServer.call(pid, {:add, title, amount, category})
    end

    def list_expenses(pid) do
        GenServer.call(pid, :list)
    end

    @impl true
    def handle_call({:add, title, amount, category}, _from, expenses) do
        new_expenses = Core.add(expenses, title, amount, category)
        {:reply, :ok, new_expenses}
    end

    @impl true
    def handle_call(:list, _from, expenses) do
        {:reply, Core.list(expenses), expenses}
    end
    @impl true
    def init(:ok) do
        {:ok, Core.new()}
    end
end
