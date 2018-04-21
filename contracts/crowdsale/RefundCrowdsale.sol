pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

/**
 * @title Crowdsale
 * @dev Crowdsale is a base contract for managing a token crowdsale,
 * allowing investors to purchase tokens with ether. This contract implements
 * such functionality in its most fundamental form and can be extended to provide additional
 * functionality and/or custom behavior.
 * The external interface represents the basic interface for purchasing tokens, and conform
 * the base architecture for crowdsales. They are *not* intended to be modified / overriden.
 * The internal interface conforms the extensible and modifiable surface of crowdsales. Override 
 * the methods to add functionality. Consider using 'super' where appropiate to concatenate
 * behavior.
 */

contract RefundCrowdsale is RefundableCrowdsale, MintedCrowdsale, CappedCrowdsale {
  using SafeMath for uint256;

  /**
     * @dev Paused if didn't set params
     */
  bool public isSetParams = false;

  /**
   * @param _rate Number of token units a buyer gets per wei
   * @param _wallet Address where collected funds will be forwarded to
   * @param _token Address of the token being sold
   */
  function RefundCrowdsale(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    address _owner
  )
  Crowdsale(_rate, _wallet, _token)
  RefundableCrowdsale(1000 ether)
  TimedCrowdsale(now + 3600, now + 3600*24)
  CappedCrowdsale(1 ether)
  public
  {
    owner = _owner;
  }

  // -----------------------------------------
  // Crowdsale external interface
  // -----------------------------------------

  /**
   * @dev fallback function ***DO NOT OVERRIDE***
   */
  function () external payable {
    require(!isSetParams);
    buyTokens(msg.sender);
  }

  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    require(!isSetParams);
    super.buyTokens(_beneficiary);
  }

  /**
   * @dev set crowdsale params
   */
  function setParams(
    uint256 _goal,
    uint256 _cap,
    uint256 _openingTime,
    uint256 _closingTime
  ) onlyOwner public {
    require(!isSetParams);
    isSetParams = true;

    require(_goal > 0);
    goal = _goal;

    require(_openingTime >= now);
    require(_closingTime >= _openingTime);

    openingTime = _openingTime;
    closingTime = _closingTime;

    require(_cap > 0);
    cap = _cap;

  }
}
