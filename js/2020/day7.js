const { getInput } = require('./input')

const part1 = () => {
  const rules = getRules()
  const result = getBagsContainingBag('shiny gold', rules)
  return Object.keys(result).length
}

const part2 = () => {
  const rules = getRules()
  const result = getNrOfBagsInBag('shiny gold', rules)
  return result
}

const getRules = () => {
  return getInput({ filename: 'day7-input' }).reduce((result, rule) => {
    const bag = getBag(rule)
    const containedBags = getContainedBags(rule)
    result[bag] = containedBags
    return result
  }, {})
}

const getBagsContainingBag = (soughtBag, rules) => {
  let result = {}
  for (const [bag, containedBags] of Object.entries(rules)) {
    const containedBagIds = containedBags.map((b) => b.id)
    if (containedBagIds.includes(soughtBag)) {
      result[bag] = bag
      const moreBags = getBagsContainingBag(bag, rules)
      result = { ...moreBags, ...result }
    }
  }
  return result
}

const getNrOfBagsInBag = (bag, rules) => {
  return rules[bag].reduce((result, containedBag) => {
    const moreBags = getNrOfBagsInBag(containedBag.id, rules)
    return result + containedBag.count + containedBag.count * moreBags
  }, 0)
}

const getBag = (rule) => {
  return rule.match(/^[^\s]+\s[^\s]+/)[0]
}

const getContainedBags = (rule) => {
  return rule
    .match(/contain\s(.*)./)[1]
    .split(', ')
    .map((containedBag) => {
      const id = containedBag.match(/\d+\s(.+)\sbag/)
      const count = containedBag.match(/(\d+)/)
      if (!(id && count)) {
        return null
      }

      return { id: id[1], count: parseInt(count[1]) }
    })
    .filter(Boolean)
}

module.exports = { part1, part2 }
