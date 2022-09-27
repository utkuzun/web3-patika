// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string memory _text) external {
        Todo memory todoNew = Todo({text: _text, completed: false});
        todos.push(todoNew);
    }

    function updateText(uint _index, string memory _text) external {
        todos[_index].text = _text;
    }

    function get(uint _index) external view returns (Todo memory) {
        return todos[_index];
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}
