defmodule SamiMetrics.Peoples do
  import Ecto.Query, warn: false
  alias SamiMetrics.Repo
  alias SamiMetrics.Peoples.People
  alias SamiMetrics.Peoples.People2
  alias SamiMetrics.Inserting
  # alias SamiMetricsWeb.DBConnectionListener


  # def insert_all_data do
  #   people_records = Repo.all(People)

  #   Enum.each(people_records, fn person ->
  #     %People2{} =
  #       %People2{}
  #       |> Map.put(:firstname, person.firstname)
  #       |> Map.put(:lastname, person.lastname)
  #       |> Map.put(:phone, person.phone)
  #       |> Map.put(:dob, person.dob)
  #       |> Repo.insert!()
  #       Inserting.get_connection_info()
  #   end)
  # end
  def delete_all_data do
    Repo.delete_all(People2)
  end

  def update_all_phones do
    _query = from(p in People2, update: [set: [phone: "0742570244"]])
    |> Repo.update_all([])
  end

  def list_peoples do
    Repo.all(People2)
  end

  def insert_all_data do

    people_records = Repo.all(People)

    task =  Enum.each(people_records, fn person ->
        Task.async(fn ->
          %People2{} =
            %People2{}
            |> Map.put(:firstname, person.firstname)
            |> Map.put(:lastname, person.lastname)
            |> Map.put(:phone, person.phone)
            |> Map.put(:dob, person.dob)
            |> Repo.insert!()

          SamiMetrics.Inserting.get_connection_info()

        end)
        #Task.await(task, 5000)

      end)

      # Enum.each(tasks, fn task ->

      # end)
      end
  end

# task =  Enum.each(people_records, fn person ->
#   Task.async(fn ->
#     %People2{} =
#       %People2{}
#       |> Map.put(:firstname, person.firstname)
#       |> Map.put(:lastname, person.lastname)
#       |> Map.put(:phone, person.phone)
#       |> Map.put(:dob, person.dob)
#       |> Repo.insert!()

#     SamiMetrics.Inserting.get_connection_info()

#   end)
#   #Task.await(task, 5000)

# end)

# # Enum.each(tasks, fn task ->

# # end)
# end
