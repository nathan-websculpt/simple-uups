// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//NOTE: Proxies point to storage slots, not variable names
// UUPSUpgradeable has a uint256[50] __gap variable for the amount of storage slots for adding new variables in the future -- so you don't collide with other storage slots when adding new vars

// storage is in the proxy, not the implementation
// proxied contracts don't have constructors, they instead make-use of an external initializer function

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version() public pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}