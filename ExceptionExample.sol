//SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract ExceptionExample {
    mapping(address => uint64) public balanceReceived;

    function receiveMoney() public payable {
        // consumes all gas
        assert(msg.value == uint64(msg.value));
        balanceReceived[msg.sender] += uint64(msg.value);
        assert(balanceReceived[msg.sender] >= uint64(msg.value));
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        // returns remaining gas
        require(
            _amount <= balanceReceived[msg.sender],
            "Not Enough Funds, aborting"
        );
        // consumes all gas
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount
        );
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
