const assert = require('assert')
const { part1, part2 } = require('../day1')

describe('Day 1: Report Repair', function () {
  describe('part 1', function () {
    it('finds two entries that sum to 2020', function () {
      const result = part1()
      assert.equal(result, 388075)
    })
  })

  describe('part 2', function () {
    it('finds three entries that sum to 2020', function () {
      const result = part2()
      assert.equal(result, 293450526)
    })
  })
})
