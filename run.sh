#!/bin/sh

# erl -config erldns.config -pa ebin deps/**/ebin -s erldns
erl -config erldns.config -pa /usr/local/Cellar/elixir/1.2.3/lib/**/ebin _build/dev/lib/**/ebin -s erldns
