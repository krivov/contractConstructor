pragma solidity ^0.4.22;

import './ERC223_receiving_contract.sol';
import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

/**
 * @title Reference implementation of the ERC223 standard token.
 */
contract ERC223 is StandardToken {

    event Transfer(address indexed from, address indexed to, uint value, bytes data);

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint _value) public returns (bool) {
        bytes memory empty;
        return transfer(_to, _value, empty);
    }

    /**
    * @dev transfer token for a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    * @param _data Optional metadata.
    */
    function transfer(address _to, uint _value, bytes _data) public returns (bool) {
        super.transfer(_to, _value);

        if (isContract(_to)) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(msg.sender, _value, _data);
            Transfer(msg.sender, _to, _value, _data);
        }

        return true;
    }

    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint _value) public returns (bool) {
        bytes memory empty;
        return transferFrom(_from, _to, _value, empty);
    }

    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint the amount of tokens to be transferred
     * @param _data Optional metadata.
     */
    function transferFrom(address _from, address _to, uint _value, bytes _data) public returns (bool) {
        super.transferFrom(_from, _to, _value);

        if (isContract(_to)) {
            ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
            receiver.tokenFallback(_from, _value, _data);
        }

        Transfer(_from, _to, _value, _data);
        return true;
    }

    function isContract(address _addr) private view returns (bool) {
        uint length;
        assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
        }
        return (length>0);
    }
}