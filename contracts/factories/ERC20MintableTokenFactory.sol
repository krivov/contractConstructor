pragma solidity ^0.4.21;

import "./../tokens/ERC20StandardToken.sol";
import "./../MainFabric.sol";
import "./BaseFactory.sol";

contract ERC20StandardTokenFactory is BaseFactory {

    function ERC20StandardTokenFactory(address _mainFactory) public {
        require(_mainFactory != 0x0);x
        mainFabricAddress = _mainFactory;

        title = "ERC20StandardToken";

        params[0].title = "Token name";
        params[0].paramType = "string";

        params[1].title = "Token symbol";
        params[1].paramType = "string";

        params[2].title = "Decimals";
        params[2].paramType = "uint8";

        params[3].title = "Token owner";
        params[3].paramType = "address";

        params[3].title = "Total supply";
        params[3].paramType = "uint256";
    }

    function create(string _name, string _symbol, uint8 _decimals, address _owner, uint256 _totalSupply) public returns (ERC20StandardToken) {
        ERC20StandardToken newContract = new ERC20StandardToken(_name, _symbol, _decimals, _owner, _totalSupply);

        MainFabric fabric = MainFabric(mainFabricAddress);
        fabric.addContract(address(newContract), msg.sender, title);

        return newContract;
    }
}
