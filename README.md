# Expense Tracker Core (Elixir)

A pure Elixir backend module for managing expenses.
This project focuses on core backend logic without any web framework.

## Features

- Add expenses
- List expenses
- Delete expenses
- Edit expense titles
- Calculate total expenses
- Filter expenses by category
- Calculate totals by category
- Generate category summaries

All logic is implemented using core Elixir concepts:
Enum, pipelines, immutable data, and functional composition.

## Data Model

Each expense has the following fields:

- id (integer)
- title (string)
- amount (integer)
- category (string)
- inserted_at (DateTime)

## Usage

Start IEx:

iex -S mix

Create a new expense list:
e = ExpenseTrackerCore.new()
Add expenses:
e =
e
|> ExpenseTrackerCore.add("Coffee", 45, "food")
|> ExpenseTrackerCore.add("Bus", 42, "transport")

List expenses:
ExpenseTrackerCore.list(e)
Delete an expense:
e = ExpenseTrackerCore.delete(e, 1)
Edit an expense title:
e = ExpenseTrackerCore.edit_title(e, 2, "Bus ticket")
Get total amount:
ExpenseTrackerCore.total(e)

Filter by category:
ExpenseTrackerCore.by_category(e, "food")


Get total by category:
ExpenseTrackerCore.total_by_category(e, "food")


Get summary by category:



ExpenseTrackerCore.summary_by_category(e)


## Purpose

This project is intentionally kept simple to:

- Build strong Elixir fundamentals
- Practice Enum pipelines
- Learn backend data flow
- Prepare for GenServer and Phoenix-based systems

## Next Steps

- Convert module into a GenServer
- Add supervision
- Expose API via Phoenix
- Add persistence with Ecto
