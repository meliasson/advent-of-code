const fs = require('fs')
const path = require('path')

const getInput = ({ filename, separator = '\n' }) => {
  const fixturePath = path.resolve(__dirname, `./${filename}`)
  return fs.readFileSync(fixturePath, 'utf8').trim().split(separator)
}

module.exports = {
  getInput,
}
