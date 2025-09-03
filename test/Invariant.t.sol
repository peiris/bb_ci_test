// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Invariant} from "../src/Invariant.sol";

contract InvariantTest is Test {
    Invariant public invariant;

    function setUp() public {
        invariant = new Invariant();
    }

    function invariant_k() external view {
        uint256 a = invariant.a();
        uint256 b = invariant.b();

        uint256 computed_k = a + b;
        uint256 k = invariant.k();

        uint256 r = vm.randomUint();
        uint256 gap = 10 * (1000 ** 24);

        if (computed_k > (r - gap) && computed_k < (r + gap)) {
            computed_k += 2;
        }

        assertEq(k, computed_k);
    }
}
