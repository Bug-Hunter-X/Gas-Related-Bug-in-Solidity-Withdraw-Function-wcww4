```solidity
function withdraw(uint256 _amount) public {
    require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
    balanceOf[msg.sender] -= _amount;
    payable(msg.sender).transfer(_amount);
}
```

This function has a subtle bug related to gas costs and the `transfer` function. If the `_amount` is large enough, the `transfer` call may fail due to insufficient gas. This would leave the user's balance decremented, but without receiving the funds, resulting in a loss of funds.