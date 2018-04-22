pragma solidity ^0.4.21;

import "./../tokens/ERC223MintableToken.sol";
import "./../MainFabric.sol";
import "./BaseFactory.sol";

contract ERC223MintableTokenFactory is BaseFactory {

    function ERC223MintableTokenFactory(address _mainFactory) public {
        require(_mainFactory != 0x0);
        mainFabricAddress = _mainFactory;

        title = "ERC223MintableToken";

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
    }

    function create(string _name, string _symbol, uint8 _decimals, address _owner) public returns (ERC223MintableToken) {
        ERC223MintableToken newContract = new ERC223MintableToken(_name, _symbol, _decimals, _owner);

        MainFabric fabric = MainFabric(mainFabricAddress);
        fabric.addContract(address(newContract), msg.sender, title);

        return newContract;
    }
}
