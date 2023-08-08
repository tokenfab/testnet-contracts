// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 

contract ThorneIT0000012 is ERC721PresetMinterPauserAutoId, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 private _maxSupply = 499;
    
    constructor ()
        ERC721PresetMinterPauserAutoId(
          "Kartal/Soganlik Gul Apartmani, A Blok 13/9",
          "THN0000012",
          "https://terramirum.com/kartalsoganlk-gul-apartman-a-blok-139"
        )
    {}

    function mint(address _to) public virtual override {
      require(hasRole(MINTER_ROLE, _msgSender()), "Must have minter role to mint");
      require(totalSupply() <= _maxSupply, "Max Supply Has Been Reached");
      _mint(_to, _tokenIdCounter.current());
      _tokenIdCounter.increment();
    }

    /**
     *  Prevents people from accidentally sending funds here.
     */
    receive () external payable {
      require(false, "This contract is for minting NFTs.  It does not allow for receiving payments.");
    }
}
