pragma solidity ^0.4.21;

import "./../tokens/ERC223MintableToken.sol";
import "./../MainFabric.sol";
import "./BaseFactory.sol";
import "./../crowdsale/RefundCrowdsale.sol";

contract RefundCrowdsaleFactory is BaseFactory {

    function RefundCrowdsaleFactory(address _mainFactory) public {
        require(_mainFactory != 0x0);
        mainFabricAddress = _mainFactory;

        title = "RefundCrowdsale";


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
            paramType: "uint8"
        }));

        params.push(Parameter({
            title: "Token Rate",
            paramType: "uint256"
        }));

        params.push(Parameter({
            title: "Wallet",
            paramType: "address"
        }));

        params.push(Parameter({
            title: "Hard cap in ETH",
            paramType: "uint256"
        }));

        params.push(Parameter({
            title: "Opening time",
            paramType: "uint256"
        }));

        params.push(Parameter({
            title: "Closing time",
            paramType: "uint256"
        }));
    }
   
    function create( 
        string _name, 
        string _symbol,
        uint8 _decimals,
        uint256 _rate,
        address _wallet,
        uint256 _cap,
        uint256 _openingTime,
        uint256 _closingTime
    ) public returns (RefundCrowdsale) {

        ERC223MintableToken newToken = new ERC223MintableToken(_name, _symbol, _decimals, address(this));

        RefundCrowdsale newCrowdsale = new RefundCrowdsale(
            _rate,
            _wallet,
            ERC20(newToken),
            _cap,
            _openingTime,
            _closingTime
        );

        newToken.transferOwnership(newCrowdsale);

        MainFabric fabric = MainFabric(mainFabricAddress);
        fabric.addContract(address(newToken), msg.sender, 'ERC223MintableToken');
        fabric.addContract(address(newCrowdsale), msg.sender, title);

        return newCrowdsale;
    }
}
