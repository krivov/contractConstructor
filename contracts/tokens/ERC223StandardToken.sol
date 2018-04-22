pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "./ERC223/ERC223.sol";

contract ERC223StandardToken is StandardToken, ERC223 {

    string public name = "";
    string public symbol = "";
    uint8 public decimals = 18;

    function ERC223StandardToken(string _name, string _symbol, uint8 _decimals, address _owner, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        totalSupply_ = _totalSupply;
        balances[_owner] = _totalSupply;
        Transfer(0x0, _owner, _totalSupply);
    }
}
