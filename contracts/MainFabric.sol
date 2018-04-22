pragma solidity ^0.4.21;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import "zeppelin-solidity/contracts/math/SafeMath.sol";

//import "./tokens/ERC20StandardToken.sol";
//import "./tokens/ERC20MintableToken.sol";
//import "./crowdsale/RefundCrowdsale.sol";

contract MainFabric is Ownable {

    using SafeMath for uint256;

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

    struct Admin {
        address addr;
        address[] contratcs;
        uint256 numContratcs;
        uint256 index;
    }

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


    // ---====== ADMINS ======---
    /**
     * @dev Get contract object by address
     */
    mapping(address => Admin) public admins;

    /**
     * @dev Contracts addresses list
     */
    address[] public adminsAddr;

    /**
     * @dev Count of contracts in list
     */
    function numAdmins() public view returns (uint256)
    { return adminsAddr.length; }

    function getAdminContract(address _adminAddress, uint256 _index) public view returns (
        address
    ) {
        return (
            admins[_adminAddress].contratcs[_index]
        );
    }

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
        contracts[_address].index = contractsAddr.push(_address) - 1;

        if (admins[_owner].addr != _owner) {
            admins[_owner].addr = _owner;
            admins[_owner].index = adminsAddr.push(_owner) - 1;
        }

        admins[_owner].contratcs.push(contracts[_address].addr);
        admins[_owner].numContratcs++;

        return true;
    }
}
