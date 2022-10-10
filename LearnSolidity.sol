// Solidity is a high-level programming language used to implement smart contracts 
// A smart contract is a self-executing contract in which the terms of agreement between the parties, i.e. buyer and seller, are directly written in lines of code and stored on the blockchain, where they are automatically executed when the predetermined conditions are met.

// SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.4; // Solidity version compiler

// Interface - Talking to other SC without needing to have the complete code on chain 
interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _value) external returns(bool success);
}

contract learnSolidity { // start with contract keyword and arbitrary name 
   event Log(string message);

   function deposit(address _tokenAddress, uint _amount) public { // Deposit function interface
       IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
   }

// Data Types
string public myString = "My string"; 
string public age;
string public salute = "Hello World";

// Global Variables
function paySent() public payable {
    require(msg.sender == tx.origin); // msg.sender = caller of function, tx.origin = origin of transaction
    amount = msg.value; // Amount of ether sent alongside the transaction
}

// Other types
bool public boolean2 = false;
uint public myUint = 2;
int public myInt = -2;
address public myAddress = 0xeb9A114797953fC9DEb0f91168661d15Cfd5Fc34;
address private owner;
uint public amount;

// Arrays
uint[] public array = [2, 3, 4];
uint[] public array1;
uint[] public array2;
string[] public array3 = ["pear", "berries", "avocado"];


// Visibility in solidity 
string private age1; // Only accesible inside the smart contract
string internal age2; // Accesible inside smart contract but can be inherited
string public age3; // Can be called inside/outside smart contract and also inherited

// function visiblity
function checkVisibility() public { // Can be called outside SC and called by another function
}

function checkVisibility1() private { // Cannot be called outside SC but can be called inside of another function in thesame SC
}

function checkVisibility2() external { // Can only be called outside the SC
}

function checkVisibility3() internal { // Can only be called inside the SM from another function
}

// function Modifiers 
function checkAge() public view returns (string memory) { // View function can read the state of the blockchain but cannot modify state
    return age;
}

function checkAge2() public pure returns(uint) { // Pure function cannot read the state of the blockchain nor modify state
    return 2;
}

function acceptPayment() public payable { // Payable functions are allowed to receive ether whenever transaction is submitted
    msg.value > tx.gasprice;
}

// Custom modifiers
modifier onlyOwner { // This restricts who can call a specific function reserved for the owner
    require(msg.sender == owner, 'caller must be owner');
    _;
}

// special function 'Constructor' is only called once whenever contract is put on the blockchain
constructor(string memory _age) { 
    age = _age;
}

// There are two types of functions in solidity write functions and read functions 
function setValue(string memory _age) public { // This is a write function so you have to pay a gas fee to call function 
    age = _age;
}

function getValue() public view returns (string memory) { // While with the read function is completely free
    return age;
}

// Operators in solidity 
function eq(uint q, uint w) external pure returns(bool) { // Equal 
    return q == w;
}

function notEq(uint q, uint w) external pure returns(bool) { // Not Equal 
    return q != w;
}

function gT(uint q, uint w) external pure returns(bool) { // Greater than
    return q > w;
}

function lT(uint q, uint w) external pure returns(bool) { // Less than
    return q < w;
}

function gTEq2(uint q, uint w) external pure returns(bool) { // Greater than Equal to
    return q >= w;
}

function lTEq2(uint q, uint w) external pure returns(bool) { // Less than Equal to
    return q <= w;
}

function add(uint q, uint w) external pure returns(uint) { // Addition 
    return  q + w;
}

function  sub(uint q, uint w) external pure returns(uint) { // Subtraction 
    return q - w;
}

function div(uint q, uint w) external pure returns(uint) { // Division 
    return q / w;
}

function mul(uint q, uint w) external pure returns(uint) { // Multiplication 
    return q * w;
}

function exp(uint q, uint w) external pure returns(uint) { // Exponents
    return q ** w;
}

function mod(uint q, uint w) external pure returns(uint) { // Modulus
    return q % w;
}

function xor(uint q, uint w) external pure returns(uint) { // Bitwise Xor
    return q ^ w;
}

function inc(uint q) external pure returns(uint) { // Increment
    q++;
    return q;
}

function dec(uint q) external pure returns(uint) { // Decrement
    q--;
    return q;
}

function and(bool q, bool w) external pure returns(bool) { // And making sure both things are true
    return q && w;
}

function or(bool q, bool w) external pure returns(bool) { // Or either one of the variables is true
    return q || w;
}

function not(bool q) external pure returns(bool) { // Check if something is not true
    return !q;
}

function addExample() external pure returns(bool) {
    return (1+1 == 2) && (2+2 == 4);
}

// Conditionals in Solidity
function evenOrOdd(uint q) public pure returns (string memory) {
    if(q % 2 == 0) {  // if q % 2 == 0 return 'even', else return 'odd'
        return "even";
    } else {
        return "odd";
    }
}

function evenOrOdd1(uint q) public pure returns (string memory) {
    if(q % 2 == 0) {
        return "even";
    }
    return "odd";
}

function evenOrOdd2(uint q) public pure returns (string memory) {
    return q % 2 == 0 ? "even" : "odd";
} 

// Mappings - Key value pairs used to store information inside SC
mapping(uint => address) public accountBalance;
mapping(uint => string) public name;
mapping(address => uint) public addresses;
mapping(address => bool) public hasVoted;
mapping(address => mapping(uint => bool)) public myMapping; // Nested mapping - mapping inside a mapping

// Structs - Lets you create your own types
struct structPacking {
    uint32 a;
    uint32 b;
    uint16 c;
    uint16 d;
}

// Ether - Native currency of the ethereum blockchain
uint public value1 = 1 wei;
uint public value2 = 2;
uint public value3 = 1 gwei;
uint public value4 = 1000000000;
uint public value5 = 1 ether;
uint public value6 = 1000000000000000000;

receive() external payable{} // Can receive ether directly via a SC if you call it external payable

function checkBalance() public view returns (uint) { // Can check balance of any address in SC like this
    return address(this).balance;
}

function transfer(address payable _to) public payable { // Sending ether to an address
    (bool sent, ) = _to.call{value: msg.value}("");
    require(sent, "Failed!");
}

// Error Handling
function example1(uint _amount) public {
    require(_amount > 10, "must be greater than 10");
    emit Log("success");
}

function example2(uint _amount) public {
    if(_amount <= 10) {
        revert("must be greater than 10");
    }
    emit Log("success");
}

// Events - Lets you subscribe externally to know whenever something has been called
event SaluteUpdated(
    address indexed _user,
    string _salute
);

function updateSalute(string memory _salute) public {
    salute = _salute;
    emit SaluteUpdated(msg.sender, _salute); // Trigger event with the emit keyword
}

}

