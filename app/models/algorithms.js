function solve(a0, a1, a2, b0, b1, b2){
    var alice = 0
    var bob = 0
    
    if(a0 > b0){
        alice += 1
    }
    else if(a0 < b0){
        bob += 1
    }
    if(a1 > b1){
        alice += 1
    }
    else if(a1 < b1){
        bob += 1
    }
    if(a2 > b2){
        alice += 1
    }
    else if(a2 < b2){
        bob += 1
    }
    return (alice, bob)
}