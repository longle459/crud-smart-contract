// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Crud {
    struct Player {
        uint256 id;
        string name;
    }

    Player[] public player;
    uint256 public nextId = 1;

    function loopId(uint256 id) internal view returns (uint256 _id) {
        for (uint256 i = 0; i < player.length; i++) {
            if (player[i].id == id) {
                return i;
            }
        }
        revert("Player does not exist");
    }

    function create(string memory name) public {
        player.push(Player(nextId, name));
        nextId++;
    }

    function read(uint256 id) public view returns (uint256, string memory) {
        uint256 i = loopId(id);
        return (player[i].id, player[i].name);
    }

    function update(uint256 id, string memory _name) public {
        uint256 i = loopId(id);
        player[i].name = _name;
    }

    function delete_data(uint256 id) public {
        uint256 i = loopId(id);
        delete (player[i]);
    }
}
