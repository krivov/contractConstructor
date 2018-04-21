pragma solidity ^0.4.21;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import "zeppelin-solidity/contracts/math/SafeMath.sol";

//import "./tokens/ERC20StandardToken.sol";
//import "./tokens/ERC20MintableToken.sol";
//import "./crowdsale/RefundCrowdsale.sol";

contract MainFabric is Ownable {

    using SafeMath for uint256;

    /**
     * @dev Create token
     * @param owner Owner address
     * @param token Token address
     * @param contractType Contract type
     * @param name Token name
     * @param symbol Token symbol
     */
//    event TokenCreated(
//        address indexed owner,
//        address indexed token,
//        string contractType,
//        string name,
//        string symbol
//    );

    /**
     * @dev Create crowdsale
     * @param owner Owner address
     * @param crowdsale Token address
     * @param contractType Contract type
     */
//    event CrowdsaleCreated(
//        address indexed owner,
//        address indexed crowdsale,
//        string contractType
//    );
//
//    struct Token {
//        address token;
//        string tokenType;
//        string name;
//        string symbol;
//        uint256 indexToken;
//    }
//
//    struct Crowdsale {
//        address crowdsale;
//        address token;
//        address owner;
//        string contractType;
//        bool isContract;
//        uint256 indexCrowdSale;
//    }

    struct Contract {
        address addr;
        address owner;
        address fabric;
        string contractType;
        uint256 index;
    }

    struct Fabric {
        address addr;
        address owner;
        bool isActive;
        uint256 index;
    }

    // ---====== TOKENS ======---
    /**
     * @dev Get token object by address
     */
    //mapping(address => Token) public tokens;

    /**
     * @dev Tokens addresses list
     */
    //address[] public tokensAddr;

    /**
     * @dev Count of campaigns in list
     */
//    function numTokens() public view returns (uint256)
//    { return tokensAddr.length; }

    // ---====== CROWDSALES ======---
    /**
     * @dev Get token object by address
     */
    //mapping(address => Crowdsale) public crowdsales;

    /**
     * @dev Tokens addresses list
     */
    //address[] public crowdsalesAddr;

    /**
     * @dev Count of campaigns in list
     */
//    function numCrowdsales() public view returns (uint256)
//    { return crowdsalesAddr.length; }


    // ---====== CONTRACTS ======---
    /**
     * @dev Get contract object by address
     */
    mapping(address => Contract) public contracts;

    /**
     * @dev Contracts addresses list
     */
    address[] public contractsAddr;

    /**
     * @dev Count of contracts in list
     */
    function numContracts() public view returns (uint256)
    { return contractsAddr.length; }


    // ---====== FABRICS ======---
    /**
     * @dev Get fabric object by address
     */
    mapping(address => Fabric) public fabrics;

    /**
     * @dev Fabrics addresses list
     */
    address[] public fabricsAddr;

    /**
     * @dev Count of fabrics in list
     */
    function numFabrics() public view returns (uint256)
    { return fabricsAddr.length; }

    /**
   * @dev Throws if called by any account other than the owner.
   */
    modifier onlyFabric() {
        require(fabrics[msg.sender].isActive);
        _;
    }

    // ---====== CONSTRUCTOR ======---

    function MainFabric() public {

    }

    /**
     * @dev Create standard token
     * @param _name Token name
     * @param _symbol Token symbol
     * @param _decimals Decimals
     * @param _owner Owner account address
     * @param _totalSupply Total supply
     */
//    function createStandardToken(
//        string _name,
//        string _symbol,
//        uint8 _decimals,
//        address _owner,
//        uint256 _totalSupply
//    )
//    public
//    returns (ERC20StandardToken tokenAddress)
//    {
//        require(_owner != 0x0);
//
//        ERC20StandardToken newToken = new ERC20StandardToken(_name, _symbol, _decimals, _owner, _totalSupply);
//
//        tokens[newToken].token = newToken;
//        tokens[newToken].tokenType = 'ERC20StandardToken';
//        tokens[newToken].name = _name;
//        tokens[newToken].symbol = _symbol;
//        tokens[newToken].indexToken = tokensAddr.push(newToken) - 1;
//
//        TokenCreated(_owner, newToken, 'ERC20StandardToken', _name, _symbol);
//
//        return newToken;
//    }

    /**
     * @dev Create mintable token
     * @param _name Token name
     * @param _symbol Token symbol
     * @param _decimals Decimals
     * @param _owner Owner account address
     */
//    function createMintableToken(
//        string _name,
//        string _symbol,
//        uint8 _decimals,
//        address _owner
//    )
//    public
//    returns (ERC20MintableToken tokenAddress)
//    {
//        require(_owner != 0x0);
//
//        ERC20MintableToken newToken = new ERC20MintableToken(_name, _symbol, _decimals, _owner);
//
//        tokens[newToken].token = newToken;
//        tokens[newToken].tokenType = 'ERC20MintableToken';
//        tokens[newToken].name = _name;
//        tokens[newToken].symbol = _symbol;
//        tokens[newToken].indexToken = tokensAddr.push(newToken) - 1;
//
//        TokenCreated(_owner, newToken, 'ERC20MintableToken', _name, _symbol);
//
//        return newToken;
//    }

    /**
     * @dev Create refund crowdsale
     * @param _name Token name
     * @param _symbol Token symbol
     * @param _decimals Decimals
     * @param _rate Rate
     * @param _wallet Wallet address
     * @param _goal Goal
     * @param _cap Cap
     * @param _openingTime Crowdsale starts
     * @param _closingTime Crowdsale ends
     */
//    function createRefundCrowdsale(
//        string _name,
//        string _symbol,
//        uint8 _decimals,
//        uint256 _rate,
//        address _wallet,
//        uint256 _goal,
//        uint256 _cap,
//        uint256 _openingTime,
//        uint256 _closingTime
//    )
//    public
//    returns (RefundCrowdsale crowdsaleAddress)
//    {
//        ERC20MintableToken newToken = createMintableToken(_name, _symbol, _decimals, address(this));
//
//        RefundCrowdsale newCrowdsale = new RefundCrowdsale(
//            _rate,
//            _wallet,
//            ERC20(newToken),
//            msg.sender
//        );
//
//        newCrowdsale.setParams(
//            _goal,
//            _cap,
//            _openingTime,
//            _closingTime
//        );
//
//        crowdsales[newCrowdsale].crowdsale = newCrowdsale;
//        crowdsales[newCrowdsale].token = newToken;
//        crowdsales[newCrowdsale].owner = msg.sender;
//        crowdsales[newCrowdsale].contractType = 'RefundCrowdsale';
//        crowdsales[newCrowdsale].indexCrowdSale = crowdsalesAddr.push(newCrowdsale) - 1;
//
//        CrowdsaleCreated(msg.sender, newCrowdsale, 'RefundCrowdsale');
//
//        return newCrowdsale;
//    }

    /**
     * @dev Add fabric
     * @param _address Fabric address
     */
    function addFabric(
        address _address
    )
    public
    onlyOwner
    returns (bool)
    {
        fabrics[_address].addr = _address;
        fabrics[_address].owner = msg.sender;
        fabrics[_address].isActive = true;
        fabrics[_address].index = fabricsAddr.push(_address) - 1;

        return true;
    }

    /**
     * @dev Remove fabric
     * @param _address Fabric address
     */
    function removeFabric(
        address _address
    )
    public
    onlyOwner
    returns (bool)
    {
        require(fabrics[_address].isActive);
        fabrics[_address].isActive = false;

        uint rowToDelete = fabrics[_address].index;
        address keyToMove   = fabricsAddr[fabricsAddr.length-1];
        fabricsAddr[rowToDelete] = keyToMove;
        fabrics[keyToMove].index = rowToDelete;
        fabricsAddr.length--;

        return true;
    }

    /**
     * @dev Create refund crowdsale
     * @param _address Fabric address
     */
    function addContract(
        address _address,
        address _owner,
        string _contractType
    )
    public
    onlyFabric
    returns (bool)
    {
        contracts[_address].addr = _address;
        contracts[_address].owner = _owner;
        contracts[_address].fabric = msg.sender;
        contracts[_address].contractType = _contractType;
        contracts[_address].index = fabricsAddr.push(_address) - 1;

        return true;
    }
}
