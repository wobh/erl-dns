defmodule Echo do
  require Record
  use GenServer

  Record.defrecord :dns_rr, Record.extract(:dns_rr, from: "deps/dns/include/dns_records.hrl")
  Record.defrecord :dns_rrdata_txt, Record.extract(:dns_rrdata_txt, from: "deps/dns/include/dns_records.hrl")

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, []}
  end

  def add_to_zone do
    {:ok, {_, _, _, _soa, _, records,_, _}} = :erldns_zone_cache.get_zone_with_records(<<"example.com">>)
    :erldns_zone_cache.put_zone(
    {<<"example.com">>, <<"fuckers">>,
      [
        dns_rr(
          name: <<"example.com">>,
          type: 16,
          ttl: 3600,
          data: dns_rrdata_txt(txt: <<"I hate you">>)
          )|records]})
  end
end

#-module(echo).
#-export([start/0]).
#
#start()->
#  ok.
