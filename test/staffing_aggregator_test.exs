defmodule StaffingAggregatorTest do
  use ExUnit.Case
  doctest StaffingAggregator

  alias StaffingAggregator

  @employees [
    %{name: "Alice", project: "Project Alpha", hours_worked: 10, hourly_rate: 50.0},
    %{name: "Bob", project: "Project Beta", hours_worked: 20, hourly_rate: 40.0},
    %{name: "Charlie", project: "Project Alpha", hours_worked: 15, hourly_rate: 50.0},
    %{name: "Dana", project: "Project Gamma", hours_worked: 5, hourly_rate: 60.0}
  ]

  test "aggregates data for Project Alpha" do
    result = StaffingAggregator.aggregate_project_data(@employees, "Project Alpha")

    assert result == %{total_hours: 25, total_cost: 1250.0}
  end

  test "returns zero for a non-existent project" do
    result = StaffingAggregator.aggregate_project_data(@employees, "Nonexistent Project")

    assert result == %{total_hours: 0, total_cost: 0.0}
  end
end
