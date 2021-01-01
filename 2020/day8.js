const { getInput } = require('./input')

const part1 = () => {
  const program = getProgram()
  const result = runProgram(program, 0, 0)
  return result.accumulator
}

const part2 = () => {
  let program = getProgram()
  for (let i = 0; i < program.length; i++) {
    program = getProgram()
    const instruction = program[i]
    if (instruction.command === 'jmp') {
      instruction.command = 'nop'
    } else if (instruction.command === 'nop') {
      instruction.command = 'jmp'
    }
    const result = runProgram(program, 0, 0)
    if (result.terminated === true) {
      return result.accumulator
    }
  }

  throw new Error('Unable to fix program')
}

const getProgram = () => {
  return getInput({ filename: './day8-input' }).map((instruction) => {
    return {
      command: instruction.match(/^(.+)\s/)[1],
      argument: parseInt(instruction.match(/\s(.+)/)[1]),
      visited: false,
    }
  })
}

const runProgram = (program, line, accumulator) => {
  if (line === program.length) {
    return { accumulator, terminated: true }
  }

  const instruction = program[line]
  if (instruction.visited) {
    return { accumulator, terminated: false }
  }

  instruction.visited = true

  switch (instruction.command) {
    case 'acc':
      return runProgram(program, line + 1, accumulator + instruction.argument)
    case 'jmp':
      return runProgram(program, line + instruction.argument, accumulator)
    case 'nop':
      return runProgram(program, line + 1, accumulator)
    default:
      throw new Error(`Unknown instruction command ${instruction.command}`)
  }
}

module.exports = { part1, part2 }
