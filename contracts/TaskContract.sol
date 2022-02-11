// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract TaskContract {
    uint256 nextId;
    struct Task {
        uint256 id;
        string name;
        string description;
    }
    Task[] tasks;

    function find_index(uint256 _id) internal view returns (uint256) {
        for (uint256 i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {
                return i;
            }
        }
        revert("Task not found");
    }

    function read_task(uint256 _id)
        public
        view
        returns (
            uint256,
            string memory,
            string memory
        )
    {
        uint256 index = find_index(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

    function create_task(string memory _name, string memory _description)
        public
    {
        tasks.push(Task(nextId++, _name, _description));
    }

    function update_task(
        uint256 _id,
        string memory _name,
        string memory _description
    ) public {
        uint256 index = find_index(_id);
        tasks[index].name = _name;
        tasks[index].description = _description;
    }

    function detele_task(uint256 _id) public {
        uint256 index = find_index(_id);
        delete tasks[index];
    }
}
