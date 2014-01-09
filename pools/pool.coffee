class Pool
  name: "noname"
  chanceToFindBlock: 0  # % chance to find block
  blockchain: null
  constructor: (name, chanceToFindBlock, blockchain) ->
    @name = name
    @chanceToFindBlock = chanceToFindBlock
    @blockchain = blockchain
    @blockchain.roots[@name] = @blockchain.roots['A']

  onTick: () ->
    @dig()

  onBlock: (poolName) ->
    # pool found new block
    return if (poolName == @name)
    longest = @blockchain.getLongestChain()
    console.log(@name, "checks on new block found by", poolName) if @blockchain.verbose
    if (longest[0] > @blockchain.roots[@name].length)
      @blockchain.roots[@name] = longest[1]


  dig: () ->
    chanceToFindInThisBlock = (@chanceToFindBlock * 0.01) / @blockchain.ticksPerBlock
    # console.log(@name, "got", (chanceToFindInThisBlock * 100) + "%", "chance to find block")
    @found() if (chanceToFindInThisBlock > Math.random())

  found: () ->
    @blockchain.roots[@name] += @name
    f = () => @blockchain.onPoolFind(this)
    setTimeout(f, 0)

module.exports = Pool