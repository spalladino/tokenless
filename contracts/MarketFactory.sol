pragma solidity ^0.4.11;

import "./Market.sol";

contract MarketFactory {

  function MarketFactory() {
  }

  event MarketCreated(string text, uint endBlock, address marketAddress);

  //Creates a Market contract, performs bookkeeping, transfers ownership of the contract to the sender, and returns the address
  function createMarket(string _text, uint _blocks) external returns (address) {
    uint endDate = block.number + _blocks;
    Market market = new Market(_text, endDate);

    // TODO: Ownership queda en mkt factory
    market.transferOwnership(msg.sender);

    MarketCreated(_text, endDate, market);

    return market;
  }

  // TODO: Agregar metodo de proxy a chooseOutcome, validando que solo el que lo creó lo pueda llamar

}
