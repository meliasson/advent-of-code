const assert = require('assert')
const { part1, part2 } = require('../day2')

describe('Day 2: Password Philosophy', function () {
  describe('part 1', function () {
    it('validates passwords', function () {
      const result = part1()
      assert.equal(result, 542)
    })
  })

  describe('part 2', function () {
    it('validates passwords using another policy', function () {
      const result = part2()
      assert.equal(result, 360)
    })
  })
})
