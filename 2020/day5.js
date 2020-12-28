const { getInput } = require('./input')

const part1 = () => {
  let highestSeatId = 0
  getBoardingPasses().forEach((boardingPass) => {
    const row = getRow(boardingPass)
    const column = getColumn(boardingPass)
    const seatId = getSeatId(row, column)
    if (seatId > highestSeatId) {
      highestSeatId = seatId
    }
  })
  return highestSeatId
}

const part2 = () => {
  let result
  let previousSeatId
  getBoardingPasses()
    .sort()
    .forEach((boardingPass) => {
      const row = getRow(boardingPass)
      const column = getColumn(boardingPass)
      const seatId = getSeatId(row, column)
      if (previousSeatId && seatId > previousSeatId + 1) {
        result = seatId - 1
      }
      previousSeatId = seatId
    })
  return result
}

const getBoardingPasses = () => {
  return getInput({ filename: 'day5-input' })
}

const getRow = (boardingPass) => {
  let upper = 128
  let lower = 0
  boardingPass
    .slice(0, 7)
    .split('')
    .forEach((rowPartition) => {
      if (rowPartition === 'F') {
        upper -= (upper - lower) / 2
      } else {
        lower += (upper - lower) / 2
      }
    })
  return lower
}

const getColumn = (boardingPass) => {
  let upper = 8
  let lower = 0
  boardingPass
    .slice(7)
    .split('')
    .forEach((seatPartition) => {
      if (seatPartition === 'L') {
        upper -= (upper - lower) / 2
      } else {
        lower += (upper - lower) / 2
      }
    })
  return lower
}

const getSeatId = (row, column) => {
  return row * 8 + column
}

module.exports = { part1, part2 }
