pragma solidity >0.4.0;

contract data {
    struct Data {
        uint256 timestamp;
        string dataType;
        string dataHash;
        string key;
        address fromNode;
        address toNode;
    }

    mapping (uint256 => Data) private dataStore;
    mapping (address => bool) private authorized;

    function storeData(uint256 index, uint256 timestamp, string memory dataType, string memory dataHash, string memory key, address fromNode, address toNode) public {
        require(authorized[msg.sender], "Unauthorized access");
        dataStore[index] = Data(timestamp, dataType, dataHash, key, fromNode, toNode);
    }

    function getData(uint256 index) public view returns (uint256, string memory, string memory, string memory , address, address) {
        require(authorized[msg.sender], "Unauthorized access");
        Data memory data = dataStore[index];
        return (data.timestamp, data.dataType, data.dataHash, data.key, data.fromNode, data.toNode);
    }

    function grantAccess(address _address) public {
        require(msg.sender == 0x3dAC1E78DC8C6336E2f0c9Cf1E90B2F4F2A473F9, "Only the contract owner can grant access");
        authorized[_address] = true;
    }

    function revokeAccess(address _address) public {
        require(msg.sender == 0x3dAC1E78DC8C6336E2f0c9Cf1E90B2F4F2A473F9, "Only the contract owner can grant access");
        authorized[_address] = false;
    }

    
}
