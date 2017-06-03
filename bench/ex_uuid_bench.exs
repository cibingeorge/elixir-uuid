defmodule ExUUIDBench do
  use Benchfella

  @uuid_string "716c654f-d2b7-436b-9751-2440a9cb079d"
  @uuid_binary <<113, 108, 101, 79, 210, 183, 67, 107, 151, 81, 36, 64, 169, 203, 7, 157>>

  bench "info!" do
    ExUUID.info!(@uuid_string)
  end

  bench "binary_to_string!" do
    ExUUID.binary_to_string!(@uuid_binary)
  end

  bench "string_to_binary!" do
    ExUUID.string_to_binary!(@uuid_string)
  end

  bench "uuid1" do
    ExUUID.uuid1
    :ok
  end

  bench "uuid3 dns" do
    ExUUID.uuid3(:dns, "test.example.com")
  end

  bench "uuid4" do
    ExUUID.uuid4
    :ok
  end

  bench "uuid5 dns" do
    ExUUID.uuid5(:dns, "test.example.com")
  end

end
