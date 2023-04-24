// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 

contract PaghenEstate is ERC721PresetMinterPauserAutoId, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 private _maxSupply = 1000;
    
    constructor ()
        ERC721PresetMinterPauserAutoId(
          "Paghen Estate",
          "PAPHN",
          "https://nft.paghenestate.io/api/v1/tokens/"
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
