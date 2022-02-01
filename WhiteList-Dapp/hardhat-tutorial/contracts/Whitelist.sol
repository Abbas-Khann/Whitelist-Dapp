//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    
    // Max number of whitelisted Addresses allowed;
    uint8 public maxWhitelistAddresses;
    

    // create a mapping of whitelistedAddresses
    // If an address is whitelisted, we would set it to true, it is false by default for all the other addresses.

    mapping (address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be to keep track of how many addresses have been whitelised
    uint8 public numAddressesWhitelisted;

    // Setting the max number of whitelisted Addresses
    // User will put the value at the time of deployment

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistAddresses = _maxWhitelistedAddresses;
    }

    // addAddresses to whitelist - This function adds the address of the sender to the whitelist
    
    function addAddressToWhitelist() public {
        // Check if the user has already been whitelisted.
        require(!whitelistedAddresses[msg.sender], "Sender has been whitelisted already");
        // Check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistAddresses, "More addresses can not be added, The maximum limit has been reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses Addresses
        numAddressesWhitelisted++;
       
       }
}

