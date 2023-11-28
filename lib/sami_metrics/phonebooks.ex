defmodule SamiMetrics.Phonebooks do
  import Ecto.Query, warn: false
  alias SamiMetrics.Repo

  alias SamiMetrics.Phonebooks.Phonebook
  alias SamiMetrics.Phonebooks.PhonebookSeeder

  @doc """
  Returns the list of productspecifications.

  ## Examples

      iex> list_productspecifications()
      [%Productspecification{}, ...]

  """
  def list_phonebook do
    Repo.all(Phonebook)
  end

    @doc """
  Inserts 1000 phonebook records.

  ## Examples

      iex> SamiMetrics.Phonebooks.PhonebookSeeder.insert_records()
      :ok
  """
  def insert_phonebook_records do
    PhonebookSeeder.insert_records()
  end

  @doc """
  Gets a single productspecification.

  Raises `Ecto.NoResultsError` if the Productspecification does not exist.

  ## Examples

      iex> get_productspecification!(123)
      %Productspecification{}

      iex> get_productspecification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phonebook!(id), do: Repo.get!(Phonebook, id)

  @doc """
  Creates a productspecification.

  ## Examples

      iex> create_productspecification(%{field: value})
      {:ok, %Productspecification{}}

      iex> create_productspecification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phonebook(attrs \\ %{}) do
    %Phonebook{}
    |> Phonebook.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a productspecification.

  ## Examples

      iex> update_productspecification(productspecification, %{field: new_value})
      {:ok, %Productspecification{}}

      iex> update_productspecification(productspecification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phonebook(%Phonebook{} = phonebook, attrs) do
    phonebook
    |> Phonebook.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a productspecification.

  ## Examples

      iex> delete_productspecification(productspecification)
      {:ok, %Productspecification{}}

      iex> delete_productspecification(productspecification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phonebook(%Phonebook{} = phonebook) do
    Repo.delete(phonebook)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking productspecification changes.

  ## Examples

      iex> change_productspecification(productspecification)
      %Ecto.Changeset{data: %Productspecification{}}

  """
  def change_phonebook(%Phonebook{} = phonebook, attrs \\ %{}) do
    Phonebook.changeset(phonebook, attrs)
  end
end
