const assert = require('assert')
const { part1, part2 } = require('../day9.js')

describe('Day 9: Encoding Error', function () {
  describe('part 1', function () {
    it('finds invalid number', function () {
      const result = part1()
      assert.equal(result, 32321523)
    })
  })

  describe('part 2', function () {
    it('finds set of numbers which sum to invalid number', function () {
      const result = part2()
      assert.equal(result, 4794981)
    })
  })
})
