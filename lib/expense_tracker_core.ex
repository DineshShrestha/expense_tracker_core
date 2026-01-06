defmodule ExpenseTrackerCore do
  @type expense :: %{
    id: pos_integer(),
    title: String.t(),
    amount: integer(),
    category: String.t(),
    inserted_at: DateTime.t()
  }

  @type t :: [expense()]

  def new, do: []

  def add(expenses, title, amount, category) do
    title = String.trim(title)
    category = String.trim(category)

    next_id = expenses 
              |> Enum.map(& &1.id)
              |> Enum.max(fn -> 0 end)
              |> Kernel.+(1)

    [%{id: next_id, title: title, amount: amount, category: category, inserted_at: DateTime.utc_now()} | expenses]
  end

  def list(expenses) do
    Enum.sort_by(expenses, & &1.id)
  end

  def total(expenses) do
    expenses
    |> Enum.map(& &1.amount)
    |> Enum.reduce(0, fn amount, acc -> acc + amount end)
  end

  def by_category(expenses, category) do
    expenses 
    |> Enum.filter(fn e -> e.category == category end)
  end
  def total_by_category(expenses, category) do
    expenses
    |> by_category(category)
    |> total()
  end

  def summary_by_category(expenses) do
    expenses
    |> Enum.group_by(& &1.category)
    |> Enum.reduce(%{}, fn {category, item}, acc -> 
      total = item
                |> Enum.map(& &1.amount)
                |> Enum.reduce(0, &+/2)
    Map.put(acc, category, total)
    end)
  end
  def edit_title(expenses, id, new_title) do
    new_title = String.trim(new_title)

    Enum.map(expenses, fn e -> 
      if e.id == id do 
        %{e | title: new_title}
      else 
        e
      end
    end)
  end
  def delete(expenses, id) do
    Enum.reject(expenses, fn e -> e.id == id end)
  end
end
