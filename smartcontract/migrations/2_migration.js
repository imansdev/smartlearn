const SmartLearn = artifacts.require("SmartLearn");
const Financable = artifacts.require("Financable");

module.exports = function (deployer) {
  deployer.deploy(SmartLearn);
  deployer.deploy(Financable);
};
