defmodule SamiMetrics.Phonebooks.PhonebookSeeder do
  import Ecto.Query

  def insert_records do
    SamiMetrics.Repo.transaction(fn ->
      records =
        Enum.map(1..1000, fn _ ->
          %SamiMetrics.Phonebooks.Phonebook{
            phone: "123-456-7890", # Adjust with your own data
            firstname: "John",
            lastname: "Doe",
            address: "123 Main St"
          }
        end)

      SamiMetrics.Repo.insert_all(SamiMetrics.Phonebooks.Phonebook, records)
    end)
  end
end
