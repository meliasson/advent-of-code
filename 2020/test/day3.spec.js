const assert = require('assert')
const { part1, part2 } = require('../day3')

describe('Day 3: Toboggan Trajectory', function () {
  describe('part 1', function () {
    it('counts number of trees encountered', function () {
      const result = part1()
      assert.equal(result, 156)
    })
  })

  describe('part 2', function () {
    it('counts number of trees encountered on multiple slopes', function () {
      const result = part2()
      assert.equal(result, 3521829480)
    })
  })
})
