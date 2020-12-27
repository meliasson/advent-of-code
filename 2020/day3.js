const { getInput } = require('./input')

const part1 = () => {
  const map = getMap()
  const slopes = [{ x: 3, y: 1 }]
  return countTreesInSlopes(map, slopes)
}

const part2 = () => {
  const map = getMap()
  const slopes = [
    { x: 1, y: 1 },
    { x: 3, y: 1 },
    { x: 5, y: 1 },
    { x: 7, y: 1 },
    { x: 1, y: 2 },
  ]
  return countTreesInSlopes(map, slopes)
}

const getMap = () => {
  return getInput({ filename: 'day3-input' })
}

const countTreesInSlopes = (map, slopes) => {
  const results = []
  for (var i = 0; i < slopes.length; i++) {
    const result = countTreesInSlope(map, slopes[i])
    results.push(result)
  }
  return results.reduce((acc, cur) => acc * cur)
}

const countTreesInSlope = (map, slope) => {
  let result = 0
  for (
    let rowIndex = 0, colIndex = 0;
    rowIndex < map.length;
    rowIndex = rowIndex + slope.y, colIndex = colIndex + slope.x
  ) {
    const pos = map[rowIndex][colIndex % map[rowIndex].length]
    if (pos === '#') result++
  }
  return result
}

module.exports = {
  part1,
  part2,
}
