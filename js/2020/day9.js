const { getInput } = require('./input')

const part1 = () => {
  const preambleSize = 25
  const data = getData()
  for (let i = preambleSize; i < data.length; i++) {
    const result = isNumberValid(data[i], data.slice(i - preambleSize, i))
    if (!result) {
      return data[i]
    }
  }
}

const part2 = () => {
  const invalidNumber = 32321523
  const data = getData()
  for (let i = 0; i < data.length; i++) {
    const result = getContigiousSet(invalidNumber, data.slice(i))
    if (result.length) {
      return Math.min(...result) + Math.max(...result)
    }
  }
}

const getData = () => {
  return getInput({ filename: './day9-input' }).map((number) =>
    parseInt(number)
  )
}

const isNumberValid = (number, data) => {
  for (let i = 0; i < data.length; i++) {
    for (let j = i + 1; j < data.length; j++) {
      if (data[i] + data[j] === number) {
        return true
      }
    }
  }
  return false
}

const getContigiousSet = (number, data) => {
  let sum = 0
  let counter = 0
  let contigiousSet = []
  while (sum < number) {
    sum += data[counter]
    contigiousSet.push(data[counter])
    counter++
  }
  if (counter > 2 && sum === number) {
    return contigiousSet
  }
  return []
}

module.exports = { part1, part2 }
