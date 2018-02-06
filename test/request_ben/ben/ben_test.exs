defmodule RequestBen.BenTest do
  use RequestBen.DataCase

  alias RequestBen.Ben

  describe "bins" do
    alias RequestBen.Ben.Bin

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def bin_fixture(attrs \\ %{}) do
      {:ok, bin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ben.create_bin()

      bin
    end

    test "list_bins/0 returns all bins" do
      bin = bin_fixture()
      assert Ben.list_bins() == [bin]
    end

    test "get_bin!/1 returns the bin with given id" do
      bin = bin_fixture()
      assert Ben.get_bin!(bin.id) == bin
    end

    test "create_bin/1 with valid data creates a bin" do
      assert {:ok, %Bin{} = bin} = Ben.create_bin(@valid_attrs)
      assert bin.name == "some name"
    end

    test "create_bin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ben.create_bin(@invalid_attrs)
    end

    test "update_bin/2 with valid data updates the bin" do
      bin = bin_fixture()
      assert {:ok, bin} = Ben.update_bin(bin, @update_attrs)
      assert %Bin{} = bin
      assert bin.name == "some updated name"
    end

    test "update_bin/2 with invalid data returns error changeset" do
      bin = bin_fixture()
      assert {:error, %Ecto.Changeset{}} = Ben.update_bin(bin, @invalid_attrs)
      assert bin == Ben.get_bin!(bin.id)
    end

    test "delete_bin/1 deletes the bin" do
      bin = bin_fixture()
      assert {:ok, %Bin{}} = Ben.delete_bin(bin)
      assert_raise Ecto.NoResultsError, fn -> Ben.get_bin!(bin.id) end
    end

    test "change_bin/1 returns a bin changeset" do
      bin = bin_fixture()
      assert %Ecto.Changeset{} = Ben.change_bin(bin)
    end
  end
end
