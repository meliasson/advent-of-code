const { getInput } = require('./input')

const part1 = () => {
  return getGroupAnswers()
    .map((groupAnswer) => {
      return groupAnswer
        .replace(/\n/g, '')
        .split('')
        .reduce((result, answer) => {
          result[answer] = 1
          return result
        }, {})
    })
    .reduce((sum, answer) => {
      return sum + Object.keys(answer).length
    }, 0)
}

const part2 = () => {
  return getGroupAnswers()
    .map((groupAnswer) => countNrOfYesAnswersWhereGroupAgrees(groupAnswer))
    .reduce((result, nrOfAgreements) => result + nrOfAgreements)
}

const getGroupAnswers = () => {
  return getInput({ filename: 'day6-input', separator: '\n\n' })
}

const countNrOfYesAnswersWhereGroupAgrees = (groupAnswer) => {
  const groupSize = groupAnswer.split('\n').length
  const answersFromGroup = groupAnswer.replace(/\n/g, '').split('')
  const answerCount = getAnswerCountSplitByQuestions(answersFromGroup)
  return answerCount.reduce((nrOfAgreements, answerCountForQuestion) => {
    const isGroupInAgreement = answerCountForQuestion === groupSize
    if (isGroupInAgreement) {
      nrOfAgreements += 1
    }
    return nrOfAgreements
  }, 0)
}

const getAnswerCountSplitByQuestions = (answersFromGroup) => {
  const answerCount = answersFromGroup.reduce((result, answer) => {
    if (!result[answer]) {
      result[answer] = 0
    }
    result[answer] += 1
    return result
  }, {})
  return Object.values(answerCount)
}

module.exports = { part1, part2 }
