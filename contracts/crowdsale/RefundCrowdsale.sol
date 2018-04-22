pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";
import "zeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

/**
 * @title RefundCrowdsale
 * @dev RefundCrowdsale is a contract for managing a token crowdsale
 */

contract RefundCrowdsale is TimedCrowdsale, MintedCrowdsale, CappedCrowdsale {
  using SafeMath for uint256;

  /**
   * @param _rate Number of token units a buyer gets per wei
   * @param _wallet Address where collected funds will be forwarded to
   * @param _token Address of the token being sold
   */
  function RefundCrowdsale(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    uint256 _cap,
    uint256 _openingTime,
    uint256 _closingTime
  )
  Crowdsale(_rate, _wallet, _token)
  TimedCrowdsale(_openingTime, _closingTime)
  CappedCrowdsale(_cap)
  public
  {

  }
}
