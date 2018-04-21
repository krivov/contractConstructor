module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!

  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
    },
    kovan: {
      host: "localhost",
      port: 8545,
      network_id: 42,
      gasPrice: 1000000000
    },
    rinkeby: {
      host: "localhost",
      port: 8545,
      network_id: 4,
      gasPrice: 1000000000
    },
    live: {
      host: "localhost",
      port: 8545,
      network_id: 1,
      gasPrice: 10000000000,
      from: "0x0"
    }
  }
};
