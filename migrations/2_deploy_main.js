const Main = artifacts.require("./MainFabric")

module.exports = function(deployer) {
  deployer.deploy(Main)
};
