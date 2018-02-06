defmodule RequestBen.Ben do
  @moduledoc """
  The Ben context.
  """

  import Ecto.Query, warn: false
  alias RequestBen.Repo

  alias RequestBen.Ben.Bin

  @doc """
  Returns the list of bins.

  ## Examples

      iex> list_bins()
      [%Bin{}, ...]

  """
  def list_bins do
    Repo.all(Bin)
  end

  @doc """
  Gets a single bin.

  Raises `Ecto.NoResultsError` if the Bin does not exist.

  ## Examples

      iex> get_bin!(123)
      %Bin{}

      iex> get_bin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bin!(id), do: Repo.get!(Bin, id)

  @doc """
  Creates a bin.

  ## Examples

      iex> create_bin(%{field: value})
      {:ok, %Bin{}}

      iex> create_bin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bin(attrs \\ %{}) do
    %Bin{}
    |> Bin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bin.

  ## Examples

      iex> update_bin(bin, %{field: new_value})
      {:ok, %Bin{}}

      iex> update_bin(bin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bin(%Bin{} = bin, attrs) do
    bin
    |> Bin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Bin.

  ## Examples

      iex> delete_bin(bin)
      {:ok, %Bin{}}

      iex> delete_bin(bin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bin(%Bin{} = bin) do
    Repo.delete(bin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bin changes.

  ## Examples

      iex> change_bin(bin)
      %Ecto.Changeset{source: %Bin{}}

  """
  def change_bin(%Bin{} = bin) do
    Bin.changeset(bin, %{})
  end
end
