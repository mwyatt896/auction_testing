// The 'auction' program.
program auction_testing.aleo {
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }
    transition place_bid(bidder: address, amount: u64) -> Bid {
        assert_eq(self.caller, bidder);
        return Bid {
            owner: aleo1asu88azw3uqud282sll23wh3tvmvwjdz5vhvu2jwyrdwtgqn5qgqetuvr6,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }
    transition resolve(first: Bid, second: Bid) -> Bid {
        assert_eq(self.caller, aleo1asu88azw3uqud282sll23wh3tvmvwjdz5vhvu2jwyrdwtgqn5qgqetuvr6);
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }
    transition finish(bid: Bid) -> Bid {
        assert_eq(self.caller, aleo1asu88azw3uqud282sll23wh3tvmvwjdz5vhvu2jwyrdwtgqn5qgqetuvr6);
        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: false,
        };
    }
}
