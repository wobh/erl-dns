Code.require_file "../src/exdns.ex", __DIR__
ExUnit.start()

defmodule Exdns.ZoneTest do
  use ExUnit.Case

  test "hello" do
    Exdns.Zone.insert("foo", "bar")
  end

end
