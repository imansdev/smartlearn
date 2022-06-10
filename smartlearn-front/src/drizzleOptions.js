import SmartLearn from './contracts/SmartLearn.json'

const options = {
  web3: {
    block: false,
    fallback: {
      type: 'ws',
      url: 'ws://127.0.0.1:9545'
    }
  },
  contracts: [SmartLearn],
  events: {
    SmartLearn: ['LogCoursesUpdated']
  },
  polls: {
    accounts: 15000
  }
}

export default options
