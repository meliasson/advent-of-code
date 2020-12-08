const { getInput } = require('./input')

const part1 = () => {
  const report = getExpenseReport()
  return findEntries(report, 2, 2020)
}

const part2 = () => {
  const report = getExpenseReport()
  return findEntries(report, 3, 2020)
}

const getExpenseReport = () => {
  return getInput('day1-input').map((entry) => parseInt(entry))
}

const findEntries = (reportSlice, nrOfEntriesLeftToFind, soughtValue) => {
  if (nrOfEntriesLeftToFind > 1) {
    return findMoreEntries(reportSlice, nrOfEntriesLeftToFind, soughtValue)
  } else {
    return findFinalEntry(reportSlice, soughtValue)
  }
}

const findMoreEntries = (reportSlice, nrOfEntriesLeftToFind, soughtValue) => {
  for (let i = 0; i < reportSlice.length; i++) {
    const entry = reportSlice[i]
    const partialResult = findEntries(
      reportSlice.slice(1),
      nrOfEntriesLeftToFind - 1,
      soughtValue - entry
    )
    if (!partialResult) {
      continue
    }
    return entry * partialResult
  }
}

const findFinalEntry = (reportSlice, soughtValue) => {
  for (let i = 0; i < reportSlice.length; i++) {
    const entry = reportSlice[i]
    if (entry === soughtValue) {
      return entry
    }
  }
}

module.exports = {
  part1,
  part2,
}
