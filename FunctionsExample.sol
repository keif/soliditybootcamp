//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract FunctionsExample {
    mapping(address => uint256) public balanceReceived;

    address payable public owner;

    // sets the owner address to the address who deployed the Smart Contract
    constructor() {
        owner = payable(msg.sender);
    }

    // view function
    function getOwner() public view returns (address) {
        return owner;
    }

    // pure function
    // doesn't interact with storage variables i.e. "class variables"
    function convertWeiToEth(uint256 _amount) public pure returns (uint256) {
        return _amount / 1 ether;
    }

    // upon destruction, it checks who called the function
    // if the owner is called, the smart contract is destroyed
    // else, an error is thrown
    function destroySmartContract() public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(owner);
    }

    function receiveMoney() public payable {
        assert(
            balanceReceived[msg.sender] + msg.value >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "not enough funds.");
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount
        );
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    receive() external payable {
        receiveMoney();
    }
}
