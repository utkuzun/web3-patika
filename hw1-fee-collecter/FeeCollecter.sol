// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract FeeCollecter {
    address public immutable i_owner;
    uint public balance;

    constructor() {
        i_owner = msg.sender;
    }

    function withdraw(uint _amount, address payable _destAddr) public {
        require(msg.sender == i_owner, "Only owner can withdraw!!");
        require(balance >= _amount, "Insufficent funds!!");

        _destAddr.transfer(_amount);
        balance -= _amount;
    }

    receive() external payable {
        balance += msg.value;
    }
}
