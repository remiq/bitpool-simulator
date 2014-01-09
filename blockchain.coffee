_ = require('underscore')

class Blockchain
  ticksPerBlock: 10 # resolution of simulation
  interval: 100     # speed of simulation
  currentTick: 0
  allTicks: 0
  verbose: false
  limit: 0
  pools: []
  roots: {
    A: 'S'
  }

  constructor: (config) ->
    this[key] = val for key, val of config
    console.log(this)

  tick: () ->
    pool.onTick() for pool in @pools
    @currentTick += 1
    @allTicks += 1
    @onAnonymousFind() if (@currentTick > @ticksPerBlock)
    process.stdout.write('.') if not @verbose
    console.log("tick") if @verbose
    if (@limit > 0 and @allTicks > @limit)
      @onExit()
      process.exit()

  getLongestChain: () ->
    max = 0
    longest = null
    _.each(@roots, (val) ->
      if (val.length > max)
        max = val.length
        longest = val ? ''
    )
    return [max, longest]

  onAnonymousFind: () ->
    process.stdout.write('A') if not @verbose
    console.log('Anonymous found a block') if @verbose
    @currentTick = 0
    @roots['A'] += 'A'
    pool.onBlock('A') for pool in @pools


  onPoolFind: (pool) ->
    process.stdout.write(pool.name) if not @verbose
    console.log(pool.name, "found a block") if @verbose
    @currentTick = 0
    longest = @getLongestChain()
    @roots['A'] = longest[1] if (longest[0] > @roots['A'].length)
    p.onBlock(pool.name) for p in @pools


  onExit: () ->
    console.log('|||')
    console.log('Pool block chains:')
    console.log(@roots)
    console.log('Winning block chain: [length, contents]')
    longest = @getLongestChain()
    console.log(longest)
    blocks = longest[1].length - 1
    for pool in @pools
      count = longest[1].split(pool.name).length - 1
      console.log(pool.name, '( global '+pool.chanceToFindBlock + '%)', "found", count, "out of", blocks, "so", Math.floor((count/blocks)*100)+'%')


  run: () ->
    f = () => @tick()
    setInterval(f, @interval)

module.exports = Blockchain