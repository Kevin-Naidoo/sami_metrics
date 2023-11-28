defmodule SamiMetrics.Repo.Migrations.AddPhonebook do
  use Ecto.Migration

  def change do
    create table(:phonebook, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :phone, :string
      add :firstname, :string
      add :lastname, :string
      add :address, :string
      timestamps()
  end
  end
end
