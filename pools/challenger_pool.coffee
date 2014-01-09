Pool = require('./pool')

class ChallengerPool extends Pool
  offset: 1
  onBlock: (poolName) ->
    return if (poolName == @name)
    longest = @blockchain.getLongestChain()
    theirLength = longest[0]
    myLength = @blockchain.roots[@name].length
    if (myLength + @offset) > theirLength
      console.log(@name, "defies your puny block,", poolName+"!") if @blockchain.verbose
    else
      console.log(@name, "switches to plan B") if @blockchain.verbose
      @blockchain.roots[@name] = longest[1]


module.exports = ChallengerPool