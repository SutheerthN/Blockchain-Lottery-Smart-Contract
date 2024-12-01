// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract Lottery {
    address public manager;
    address payable[] public players;
    mapping(address => bool) public hasEntered; // 

    constructor() {
        manager = msg.sender;
    }

    
    function enter() public payable {
        require(msg.sender != manager, "Manager cannot enter");
        require(!hasEntered[msg.sender], "Player already entered");
        require(msg.value >= 1 ether, "Minimum amount must be paid");

        players.push(payable(msg.sender));
        hasEntered[msg.sender] = true; 
    }


    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }

    function pickWinner() public {
        require(msg.sender == manager, "Only manager can pick the winner");
        require(players.length > 0, "No players to pick a winner");

        uint index = random() % players.length;
        address payable winner = players[index];

        uint balance = address(this).balance;
        winner.transfer(balance);

        for (uint i = 0; i < players.length; i++) {
            hasEntered[players[i]] = false;
        }
        players = new address payable[](0); 
    }

    
    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
// contribution 0
// contribution 1
// contribution 2
// contribution 3
// contribution 4
// contribution 5
// contribution 6
// contribution 7
// contribution 8
// contribution 9
// commit 1
