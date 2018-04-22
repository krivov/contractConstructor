pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "./ERC223/ERC223.sol";

contract ERC223MintableToken is MintableToken, ERC223 {

    string public name = "";
    string public symbol = "";
    uint public decimals = 18;

    function ERC223MintableToken(string _name, string _symbol, uint8 _decimals, address _owner) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        owner = _owner;
    }
}
