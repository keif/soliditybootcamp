//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract A {

    uint someUint;

    function fun() public virtual {
        someUint = 5;
    }
}