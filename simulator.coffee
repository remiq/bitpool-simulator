
_ = require('underscore')

Blockchain = require('./blockchain')
Pool = require('./pools/pool')
ChallengerPool = require('./pools/challenger_pool')

config =
  ticksPerBlock: 10
  interval: 10
  verbose: false
  limit: 1000

b = new Blockchain(config)
b.pools.push(new ChallengerPool("C", 70, b)) # Challenger
#b.pools.push(new Pool("C", 60, b)) # NotChallenger
#b.pools.push(new Pool("I", 32, b)) # GHash.IO
b.pools.push(new Pool("G", 20, b)) # BTC Guild
b.pools.push(new Pool("E", 12, b)) # Eligius

# b.pools.push(new ChallengerPool("C", 50, b))

b.run()

process.on('SIGINT',  () ->
  b.onExit()
  process.exit();
);

