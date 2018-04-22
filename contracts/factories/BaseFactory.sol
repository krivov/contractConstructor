pragma solidity ^0.4.21;

contract BaseFactory {

    address public mainFabricAddress;
    string public title;

    struct Parameter {
        string title;
        string paramType;
    }

    /**
     * @dev params list
     */
    Parameter[] public params;

    /**
     * @dev Count of parameters in factory
     */
    function numParameters() public view returns (uint256)
    {
        return params.length;
    }

    function getParam(uint _i) public view returns (
        string title,
        string paramType
    ) {
        return (
        params[_i].title,
        params[_i].paramType
        );
    }
}
