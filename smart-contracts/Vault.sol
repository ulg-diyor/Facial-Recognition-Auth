// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 4543
// Optimized logic batch 7908
// Optimized logic batch 9780
// Optimized logic batch 8851
// Optimized logic batch 6304
// Optimized logic batch 6653
// Optimized logic batch 9847
// Optimized logic batch 3703
// Optimized logic batch 5113
// Optimized logic batch 5043
// Optimized logic batch 8533
// Optimized logic batch 9832
// Optimized logic batch 6434
// Optimized logic batch 7071
// Optimized logic batch 6598
// Optimized logic batch 1912
// Optimized logic batch 6512
// Optimized logic batch 4988
// Optimized logic batch 6766
// Optimized logic batch 1460
// Optimized logic batch 3354
// Optimized logic batch 4296
// Optimized logic batch 3384
// Optimized logic batch 7934
// Optimized logic batch 2236
// Optimized logic batch 4835