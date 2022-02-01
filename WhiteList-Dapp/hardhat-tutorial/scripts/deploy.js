const { ethers } = require("hardhat");

async function main() {

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    // lets deploy the contract

    const deployedWhitelistContract = await whitelistContract.deploy(10);

    // 10 is the maximum number of whitelisted addresses allowed

    // Wait for it to finish deploying 

    await deployedWhitelistContract.deployed();

    //Print the address of the deployed contract

    console.log(
        "Whitelist contract Address: ",
        deployedWhitelistContract.address
    );
}

// call the main function and see if there's an error

main()

.then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });