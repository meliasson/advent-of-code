const fs = require('fs')
const path = require('path')

const getInput = (filename) => {
  const fixturePath = path.resolve(__dirname, `./${filename}`)
  return fs.readFileSync(fixturePath, 'utf8').trim().split('\n')
}

module.exports = {
  getInput,
}
