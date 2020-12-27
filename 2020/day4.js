const { getInput } = require('./input')

const part1 = () => {
  return getNrOfValidPassports(part1ValidationRules)
}

const part2 = () => {
  return getNrOfValidPassports(part2ValidationRules)
}

const part1ValidationRules = [
  { field: 'byr', required: true },
  { field: 'iyr', required: true },
  { field: 'eyr', required: true },
  { field: 'hgt', required: true },
  { field: 'hcl', required: true },
  { field: 'ecl', required: true },
  { field: 'pid', required: true },
  { field: 'cid', required: false },
]

const part2ValidationRules = [
  { field: 'byr', required: true, format: /^((19[2-9][0-9])|(200[0-2]))$/ },
  { field: 'iyr', required: true, format: /^((201\d)|(2020))$/ },
  { field: 'eyr', required: true, format: /^((202\d)|(2030))$/ },
  {
    field: 'hgt',
    required: true,
    format: /^((((1[5-8]\d)|(19[0-3]))cm)|(((59)|(6[0-9])|(7[0-6]))in))$/,
  },
  { field: 'hcl', required: true, format: /^#[a-f0-9]{6}$/ },
  { field: 'ecl', required: true, format: /^(amb|blu|brn|gry|grn|hzl|oth)$/ },
  { field: 'pid', required: true, format: /^\d{9}$/ },
  { field: 'cid', required: false, format: '.*' },
]

const getNrOfValidPassports = (validationRules) => {
  return getPassports()
    .map((passport) => {
      return parsePassport(passport)
    })
    .filter((passport) => isValidPassport(passport, validationRules)).length
}

const getPassports = () => {
  return getInput({ filename: 'day4-input', separator: '\n\n' })
}

const parsePassport = (passport) => {
  const fields = passport.split(/\s/)
  return fields.reduce((result, field) => {
    const match = field.match(/(\w+):(.+)/)
    const key = match[1]
    const value = match[2]
    result[key] = value
    return result
  }, {})
}

const isValidPassport = (passport, validationRules) => {
  let result = true
  validationRules.forEach((rule) => {
    if (rule.required && !(rule.field in passport)) {
      result = false
    }
    if (
      rule.format &&
      passport[rule.field] &&
      !passport[rule.field].match(rule.format)
    ) {
      result = false
    }
  })
  return result
}

module.exports = {
  part1,
  part2,
}
