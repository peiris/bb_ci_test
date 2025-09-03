// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Invariant {
    uint256 public a;
    uint256 public b;

    uint256 public k;

    function setA(uint256 amount) public {
        a = amount;
        b = k - a;
    }

    function setB(uint256 amount) public {
        b = amount;
        a = k - b;
    }

    function setAB(uint256 a_amount, uint256 b_amount) public {
        a = a_amount;
        b = b_amount;
        k = a + b;
    }
}
