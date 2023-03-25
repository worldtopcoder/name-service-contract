// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../dnssec-oracle/BytesUtils.sol";
import "./PublicSuffixList.sol";

/**
 * @dev A public suffix list that treats all TLDs as public suffixes.
 */
contract TLDPublicSuffixList is PublicSuffixList {
    using BytesUtils for bytes;

    function isPublicSuffix(bytes calldata name)
        external
        pure
        override
        returns (bool)
    {
        uint256 labellen = name.readUint8(0);
        return labellen > 0 && name.readUint8(labellen + 1) == 0;
    }
}