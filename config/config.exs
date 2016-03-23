use Mix.Config

config :erldns,
  storage: [type: :erldns_storage_mnesia, dir: 'db', dbname: :undefined, user: :undefined, pass: :undefined, host: :undefined, port: :undefined],
  servers: [
    [name: :inet_localhost_1, address: '127.0.0.1', port: 8053, family: :inet, processes: 2],
    [name: :inet6_localhost_1, address: '::1', port: 8053, family: :inet6],
  ],
  use_root_hints: false,
  catch_exceptions: false,
  zones: 'priv/example.zone.json',
  metrics: [ port: 8082 ],
  admin: [ port: 8083, credentials: {'username', 'password'} ],
  pools: [
    {:tcp_worker_pool, :erldns_worker, [ size: 10, max_overflow: 20 ] }
  ]

config :lager,
  handlers: [
    lager_file_backend: [file: 'log/debug.log', level: :debug, size: 204857600, count: 5]
  ]

import_config "#{Mix.env}.exs"
