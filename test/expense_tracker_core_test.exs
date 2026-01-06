defmodule ExpenseTrackerCoreTest do
  use ExUnit.Case, async: true

  alias ExpenseTrackerCore, as: ET

  test "new returns empty list" do
    assert ET.new() == []
  end

  test "add assigns increasing ids and stores fields" do
    expenses =
      ET.new()
      |> ET.add(" coffee ", 45, " food ")
      |> ET.add("bus", 42, "transport")

    listed = ET.list(expenses)

    assert Enum.map(listed, & &1.id) == [1, 2]
    assert Enum.at(listed, 0).title == "coffee"
    assert Enum.at(listed, 0).category == "food"
    assert Enum.at(listed, 0).amount == 45
    assert %DateTime{} = Enum.at(listed, 0).inserted_at
  end
end
