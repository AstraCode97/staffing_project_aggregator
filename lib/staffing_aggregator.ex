defmodule StaffingAggregator do
  @moduledoc """
  A module to aggregate work hours and costs associated with a staffing team.
  """

  @doc """
  Aggregates total hours and costs for a specific project.

  ## Parameters
  - employees: A list of maps/structs representing employees.
  - project_name: The name of the project to aggregate data for.

  ## Returns
  - A map containing:
    - :total_hours - Total hours worked for the project.
    - :total_cost - Total cost associated with the project.
  """
  def aggregate_project_data(employees, project_name) do
    employees
    # Filters employees by project name to include only relevant data.
    |> Enum.filter(&(&1.project == project_name))
    |> Enum.reduce(%{total_hours: 0, total_cost: 0.0}, fn employee, acc ->
      # This step calculates cumulative totals for the filtered employees by
      # summing up their hours and the cost (hours worked * hourly rate).
      %{
        total_hours: acc.total_hours + employee.hours_worked,
        total_cost: acc.total_cost + employee.hours_worked * employee.hourly_rate
      }
    end)
  end
end
