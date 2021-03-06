const assert = require('assert')
const { part1, part2 } = require('../day5')

describe('Day 5: Binary Boarding', function () {
  describe('part 1', function () {
    it('finds the highest boarding pass seat ID', function () {
      const result = part1()
      assert.equal(result, 901)
    })
  })

  describe('part 2', function () {
    it('finds the missing boarding pass seat ID', function () {
      const result = part2()
      assert.equal(result, 661)
    })
  })
})
