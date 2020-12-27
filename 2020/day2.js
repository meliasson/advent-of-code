const { getInput } = require('./input')

const part1 = () => {
  const records = getRecords()
  return records.reduce(part1reducer, 0)
}

const part2 = () => {
  const records = getRecords()
  return records.reduce(part2reducer, 0)
}

const getRecords = () => {
  return getInput({ filename: 'day2-input' })
    .map((rawRecord) => rawRecord.match(/(\d+)-(\d+)\s(\w):\s(\w+)/))
    .map((recordParts) => buildRecord(recordParts))
}

const buildRecord = (parts) => {
  return { password: parts[4], policy: parts.slice(1, 4) }
}

const part1reducer = (result, record) => {
  return isValidPart1Record(record) ? ++result : result
}

const part2reducer = (result, record) => {
  return isValidPart2Record(record) ? ++result : result
}

const isValidPart1Record = (record) => {
  const min = record.policy[0]
  const max = record.policy[1]
  const re = RegExp(`${record.policy[2]}`, 'g')
  const nrOfOccurences = (record.password.match(re) || []).length
  return nrOfOccurences >= min && nrOfOccurences <= max
}

const isValidPart2Record = (record) => {
  const l1 = record.password[record.policy[0] - 1]
  const l2 = record.password[record.policy[1] - 1]
  const l1Match = l1 === record.policy[2]
  const l2Match = l2 === record.policy[2]
  return (l1Match && !l2Match) || (!l1Match && l2Match)
}

module.exports = {
  part1,
  part2,
}
