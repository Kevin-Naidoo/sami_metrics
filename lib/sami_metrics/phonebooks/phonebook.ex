defmodule SamiMetrics.Phonebooks.Phonebook do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  # @derive {Enumerable, only: [:id, :phone, :firstname, :lastname, :address]}
  schema "phonebook" do
    field :phone, :string
    field :firstname, :string
    field :lastname, :string
    field :address, :string

    timestamps()
  end

  @doc false
  def changeset(phonebook, attrs) do
    phonebook
    |> cast(attrs, [:phone, :firstname, :lastname, :address])
    |> validate_required([:phone, :firstname, :lastname, :address])
  end
end
