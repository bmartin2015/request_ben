defmodule RequestBen.Ben.Bin do
  use Ecto.Schema
  import Ecto.Changeset
  alias RequestBen.Ben.Bin


  schema "bins" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Bin{} = bin, attrs) do
    bin
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
