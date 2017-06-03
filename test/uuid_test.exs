defmodule ExUUIDTest do
  use ExUnit.Case

  test "ExUUID.info/1 invalid argument type" do
    assert ExUUID.info(:not_a_uuid) == {:error, "Invalid argument; Expected: String"}
  end

  test "ExUUID.info/1 invalid ExUUID" do
    assert ExUUID.info("not_a_uuid") == {:error, "Invalid argument; Not a valid UUID: not_a_uuid"}
  end

  test "ExUUID.info!/1 invalid argument type" do
    assert_raise(
      ArgumentError,
      "Invalid argument; Expected: String",
      fn ->
        ExUUID.info!(:not_a_uuid)
      end
    )
  end

  test "ExUUID.info!/1 invalid ExUUID" do
    assert_raise(
      ArgumentError,
      "Invalid argument; Not a valid UUID: not_a_uuid",
      fn ->
        ExUUID.info!("not_a_uuid")
      end
    )
  end

  # Expand the lines in info_tests.txt into individual tests for the
  # ExUUID.info!/1 and ExUUID.info/1 functions, assuming the lines are:
  #   test name || expected output || input value
  for line <- File.stream!(Path.join([__DIR__, "info_tests.txt"]), [], :line) do
    [name, expected, input] =
      line |> String.split("||") |> Enum.map(&String.strip(&1))
    test "ExUUID.info!/1 #{name}" do
      {expected, []} = Code.eval_string(unquote(expected))
      result = ExUUID.info!(unquote(input))
      assert ^expected = result
    end
    test "ExUUID.info/1 #{name}" do
      {expected, []} = Code.eval_string(unquote(expected))
      {:ok, result} = ExUUID.info(unquote(input))
      assert ^expected = result
    end
  end

end
