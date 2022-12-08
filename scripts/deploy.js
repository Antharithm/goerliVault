const hre = require("hardhat");

async function main() {

  const GoerliVault = await hre.ethers.getContractFactory("GoerliVault");
  const goerliVault = await GoerliVault.deploy();

  await goerliVault.deployed();

  console.log(
    `GoerliVault was deployed to: ${goerliVault.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});