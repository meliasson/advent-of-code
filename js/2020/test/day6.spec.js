const assert = require('assert')
const { part1, part2 } = require('../day6.js')

describe('Day 6: Custom Customs', function () {
  describe('part 1', function () {
    it('counts all "yes" answers', function () {
      const result = part1()
      assert.equal(result, 6504)
    })
  })

  describe('part 2', function () {
    it('counts "yes" answers where group is in agreement', function () {
      const result = part2()
      assert.equal(result, 3351)
    })
  })
})
