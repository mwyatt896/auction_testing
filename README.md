# auction.aleo
The auction program is to simulate a simple "auction" where anyone can place a bid in the auction run by an auctioneer. When placing a bid, your bid will be encrypted to the auctioneer's address such that it is only private between yourself and the auctioneer. This is similar to how Sotheby's works.

The participant in the auction can do one thing -- use place_bid to place a bid in the auction.

The auctioneer has two things they can do once they have the bids.
1. The auctioneer can compare compare the bids to determine the highest of the bids by using the "resolve" function. The way this works is very naive by taking in two bids as inputs, and then outputs the bid that is the higher of the two.
2. The auctioneer can select the winner by using the "finish" function. The way this works is very naive by simple transitioning the flag on the bid for winner to true.


This is a simple Aleo program consisting of 3 potential state transitions:
1. place_bid(address, u64) -> Bid
2. resolve(Bid,Bid) -> Bid
This is restricted to only the address: aleo1asu88azw3uqud282sll23wh3tvmvwjdz5vhvu2jwyrdwtgqn5qgqetuvr6. This can be changed by changing the assert.caller to any address. Perhaps even using a useDeploy hook to change the code on the fly ;;
3. finish(Bid) -> Bid 
This is restricted to only the address: aleo1asu88azw3uqud282sll23wh3tvmvwjdz5vhvu2jwyrdwtgqn5qgqetuvr6. This can be changed by changing the assert.caller to any address. Perhaps even using a useDeploy hook to change the code on the fly ;;



There are a whole bunch of opportunities to improve on the private smart contract -- some known issues with the program include:
1. There is no guarantee enforced to check that the auctioneer compared all the bids submitted when "resolving".
2. There is no ability to compare more than 2 bids in the "resolve" function.
3. There is no ability to stop receiving bids.
4. There is no ability to limit # of bids per person.
5. There is no ability to limit the auctioneer from bidding and guaranteeing they didn't bid.
6. There is no ability to prevent the auctioneer from seeing the bid values and leaking that important information to others.
7. There is no guarantee the auctioneer finishes the auction.
8. There is no guarantee the auctioneer selects the person who should actually win for the auction.


## Build Guide
To compile this Aleo program and use

Change env.example to just .env
Change the private key in the env.example to the one listed in the program.json.

run:
```bash
leo execute place_bid aleo18rkvvunalfq2kg5wc9jdzyqlqqwj9arrtx9tzdd45ch9wwczv5fqzm0h8u 2u64
```
Other functions cannot be tested without changing the assert.caller to equal the auctioneer's address. To call those, you will need to change that address the private key and env.example then run something along the lines of

See run.sh for examples or just run the below

```bash
bash run.sh
```
