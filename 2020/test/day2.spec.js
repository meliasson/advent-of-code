const assert = require('assert')
const { part1, part2 } = require('../day2')

describe('Day 2', function () {
  describe('part 1', function () {
    it('counts number of valid passwords', function () {
      const result = part1()
      assert.equal(result, 542)
    })
  })

  describe('part 2', function () {
    it('counts number of valid passwords', function () {
      const result = part2()
      assert.equal(result, 360)
    })
  })
})
