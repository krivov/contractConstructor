pragma solidity ^0.4.21;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract ERC20StandardToken is StandardToken {

    string public name = "";
    string public symbol = "";
    uint8 public decimals = 18;

    function ERC20StandardToken(string _name, string _symbol, uint8 _decimals, address _owner, uint256 _totalSupply) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;

        totalSupply_ = _totalSupply;
        balances[_owner] = _totalSupply;
        Transfer(0x0, _owner, _totalSupply);
    }
}
