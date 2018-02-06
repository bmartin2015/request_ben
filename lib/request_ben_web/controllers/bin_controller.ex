defmodule RequestBenWeb.BinController do
  use RequestBenWeb, :controller

  alias RequestBen.Ben
  alias RequestBen.Ben.Bin

  def index(conn, _params) do
    bins = Ben.list_bins()
    render(conn, "index.html", bins: bins)
  end

  def new(conn, _params) do
    changeset = Ben.change_bin(%Bin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, _params) do
    case Ben.create_bin() do
      {:ok, bin} ->
        conn
        |> put_flash(:info, "Bin created successfully.")
        |> redirect(to: bin_path(conn, :show, bin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bin = Ben.get_bin!(id)
    render(conn, "show.html", bin: bin)
  end

  def edit(conn, %{"id" => id}) do
    bin = Ben.get_bin!(id)
    changeset = Ben.change_bin(bin)
    render(conn, "edit.html", bin: bin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bin" => bin_params}) do
    bin = Ben.get_bin!(id)

    case Ben.update_bin(bin, bin_params) do
      {:ok, bin} ->
        conn
        |> put_flash(:info, "Bin updated successfully.")
        |> redirect(to: bin_path(conn, :show, bin))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bin: bin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bin = Ben.get_bin!(id)
    {:ok, _bin} = Ben.delete_bin(bin)

    conn
    |> put_flash(:info, "Bin deleted successfully.")
    |> redirect(to: bin_path(conn, :index))
  end
end
