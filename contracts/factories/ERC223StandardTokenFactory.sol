pragma solidity ^0.4.21;

import "./../tokens/ERC223StandardToken.sol";
import "./../MainFabric.sol";
import "./BaseFactory.sol";

contract ERC223StandardTokenFactory is BaseFactory {

    function ERC223StandardTokenFactory(address _mainFactory) public {
        require(_mainFactory != 0x0);
        mainFabricAddress = _mainFactory;

        title = "ERC223StandardToken";

        params.push(Parameter({
            title: "Token name",
            paramType: "string"
            }));

        params.push(Parameter({
            title: "Token symbol",
            paramType: "string"
            }));

        params.push(Parameter({
            title: "Decimals",
            paramType: "string"
            }));

        params.push(Parameter({
            title: "Token owner",
            paramType: "string"
            }));

        params.push(Parameter({
            title: "Total supply",
            paramType: "string"
            }));
    }

    function create(string _name, string _symbol, uint8 _decimals, address _owner, uint256 _totalSupply) public returns (ERC223StandardToken) {
        ERC223StandardToken newContract = new ERC223StandardToken(_name, _symbol, _decimals, _owner, _totalSupply);

        MainFabric fabric = MainFabric(mainFabricAddress);
        fabric.addContract(address(newContract), msg.sender, title);

        return newContract;
    }
}
