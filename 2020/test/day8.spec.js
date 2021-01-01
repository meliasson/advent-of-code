const assert = require('assert')
const { part1, part2 } = require('../day8.js')

describe('Day 8: Handheld Halting', function () {
  describe('part 1', function () {
    it('detects when program enters infinite loop', function () {
      const result = part1()
      assert.equal(result, 1816)
    })
  })

  describe('part 2', function () {
    it('fixes program so it terminates', function () {
      const result = part2()
      assert.equal(result, 1149)
    })
  })
})
