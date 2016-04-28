Code.require_file "../src/exdns.ex", __DIR__
ExUnit.start()

defmodule ExdnsTest do
  use ExUnit.Case

  test "hello" do
    Exdns.insert("foo", "bar")
  end

end
