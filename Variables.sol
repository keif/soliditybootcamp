// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract WorkingWithVariables {
    uint256 public myUint;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    bool public myBool;

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    uint8 public myUint8;

    function incrementUint() public {
        myUint8++;
    }

    function decreaseUint() public {
        myUint8--;
    }

    address public myAddress;

    function setAddress(address _myAddress) public {
        myAddress = _myAddress;
    }

    function getBalanceOfAddress() public view returns (uint256) {
        return myAddress.balance;
    }

    string public myString = "hello world";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}
