// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3; // Solidity version for compiler to understand & always use recent version to avoid broken code

contract learnBlockchain {    // contract syntax and opening 
    string public newbie = "Do My best Daily"; // collection of characters in quotation marks
    uint public learner;  // public uint , uint stands for unsigned integer i.e can only take positive values while Int (Signed integer) can take negative values

    constructor()  { // A Solidity constructor is called once when a new instance of a smart contract is deployed in Ethereum blockchain
    }

    function OrderOnline() external payable {  // Syntax for recieving ether in solidity i.e only a payable function can recieve ether ,otherwise the function fails
        require(msg.value == 0.0001 ether);
    }

    string blessings = "God Got You";  // syntax for return values in solidity

    function sayHello() public view returns (string memory) {
        return blessings;
    }

    struct SaveGas { //In solidity grouping similar uints in a struct(structpacking) solidity minimises required storage space since the uint32 are clustered together & thereby cost less gas
        uint32 a;
        uint32 b;
        uint16 c;
    }

    mapping(address => uint) public accountBalance; // mappings are another way of storing organized data in solidity(i.e essentially a key-value storefor storing & looking up data)

    function getDecent() public view returns (uint) { // syntax for public function in solidity
        return learner;
    }

    uint[3] fixedArray; // An array with fixed length of 3 elements
    uint[6] stringArray; // An array can contain 5 strings
    uint[]  dynamicArray; // Array has no fixed size, can keep growing 

    function _getBetter() private view returns (string memory _str) { // Syntax for private function in solidity , should have _ for function name
        return newbie;
    }
 
    modifier stayStudent() { // modifiers are used in solidity 2 ensure certain conditions are met before proceeding to executing the rest of the body of code in the method
        require(msg.sender == tx.origin);
        _;  // in solidity the modifiers must end with _;
    }

    function balanceOf(address _owner) external view returns (uint256 _balance) { // This function just takes an address ans returns how many tokens the address owns

    }

    function ownerOf(uint256 _tokenId) external view returns (address _owner) { // This function takes a tokenId and returns the address of the person who owns it

    }

    function transferFrom(address from, address to, uint256 _tokenId) external payable { // This function shows 1 way to ttrasnfer an ERC721 token

    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) { // SafeMath prevents overflowing and underflowing of contracts in solidity 
        uint256 c = a + b;
        assert (c >= a); //assert is similar 2 require,where it will throw an error if false,difference is require will return the users rest of their gas when func fails& assert will not
        return  c;
    }
} // closing contract syntax