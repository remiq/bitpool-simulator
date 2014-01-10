
_ = require('underscore')

Blockchain = require('./blockchain')
Pool = require('./pools/pool')
ChallengerPool = require('./pools/challenger_pool')

config =
  ticksPerBlock: 1
  interval: 10
  verbose: false
  limit: 1000
  enableAnonymous: false

b = new Blockchain(config)
b.pools.push(new Pool("B", 38, b))           # GHash.IO
b.pools.push(new Pool("C", 20, b))           # BTC Guild
b.pools.push(new Pool("D", 12, b))           # Eligus
b.pools.push(new Pool("E", 4, b))            # Slush
b.pools.push(new Pool("F", 4, b))            # BitMiner
b.pools.push(new Pool("R", 22, b))           # Rest

# b.pools.push(new ChallengerPool("C", 50, b))

b.run()

process.on('SIGINT',  () ->
  b.onExit()
  process.exit();
);

