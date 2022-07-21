//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract LibrariesExample {
    mapping(address => uint256) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = 1;
    }

    function sendToken(address _to, uint256 _amount) public returns (bool) {
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        return true;
    }
}
