truffle is a tool to create flatten file having openzeppelin libs contract.

# truffle prerequirities
npm install truffle -g
npm install truffle-flattener -g


# Creating flatten file
```
npm install truffle
```

```
npm install @openzeppelin/contracts@4.8.1
```

```
truffle-flattener contracts/TurnEstate/TurnEstate.sol > contracts/TurnEstate/TurnEstateFlat.sol
```