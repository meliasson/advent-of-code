const assert = require('assert')
const { part1, part2 } = require('../day7.js')

describe('Day 7: Handy Haversacks', function () {
  describe('part 1', function () {
    it('counts bags that contain a shiny gold bag', function () {
      const result = part1()
      assert.equal(result, 261)
    })
  })

  describe('part 2', function () {
    it('counts bags contained in a shiny gold bag', function () {
      const result = part2()
      assert.equal(result, 3765)
    })
  })
})
