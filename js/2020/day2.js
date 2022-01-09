const { getInput } = require('./input')

const part1 = () => {
  return getRecords().filter((r) => isValidPart1Password(r)).length
}

const part2 = () => {
  return getRecords().filter((r) => isValidPart2Password(r)).length
}

const getRecords = () => {
  return getInput({ filename: 'day2-input' })
    .map((rawRecord) => rawRecord.match(/(\d+)-(\d+)\s(\w):\s(\w+)/))
    .map((recordParts) => buildRecord(recordParts))
}

const buildRecord = (parts) => {
  return { password: parts[4], policy: parts.slice(1, 4) }
}

const isValidPart1Password = (record) => {
  const min = record.policy[0]
  const max = record.policy[1]
  const re = RegExp(`${record.policy[2]}`, 'g')
  const nrOfOccurences = (record.password.match(re) || []).length
  return nrOfOccurences >= min && nrOfOccurences <= max
}

const isValidPart2Password = (record) => {
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
