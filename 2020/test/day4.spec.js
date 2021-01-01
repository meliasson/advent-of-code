const assert = require('assert')
const { part1, part2 } = require('../day4')

describe('Day 4: Passport Processing', function () {
  describe('part 1', function () {
    it('validates passports', function () {
      const result = part1()
      assert.equal(result, 260)
    })
  })

  describe('part 2', function () {
    it('validates passports using strict rules', function () {
      const result = part2()
      assert.equal(result, 153)
    })
  })
})
