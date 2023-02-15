pragma solidity 0.8.17;



contract Storage {

    struct A {
        uint256 c;
        uint256 d;
    }

    A public a;

    uint256 c;
    address owner;
    constructor() {
        owner = msg.sender;
    }

    function set_c(uint256 b) public {
        require(msg.sender == owner);
        c = b;
    }

    function b5(A memory x) public returns (uint256) {
        require(msg.sender == owner);
        (a.c, a.d) = b4();
        x.d += 10;
        x.d += b3(a.c);
        return x.d;
    }

    function b6(uint256[] memory x) public returns (uint256[] memory) {
        require(x.length > 3);
        x[6] += 10;
        x[6] += 10;
        c += 10;
        return x;
    }

    function b4() internal returns (uint256, uint256) {
        return (10, 20);
    }

    function b3(uint256 y) internal returns (uint256) {
        a.d += 10;
        return y + 1;
    }
}

contract S {
    uint256 myVar;
    function run(uint256 x, uint256 y, uint256 z) public returns (uint256) {
        require(y >= 1);
        require(x < 1000000);
        require(y < 1000000);
        require(z < 1000000);

        require(x > 100);
        require(y > 100);
        require(z > 100);


        uint256 a = x * x;
        uint256 b = x / y;
        uint256 c = z * y;

        require(c >= 1);

        myVar = a * b / c;
        return myVar;
    }
}

contract Baz {

    bool private state1;
    bool private state2;
    bool private state3;
    bool private state4;
    bool private state5;

    function baz(int256 a, int256 b, int256 c) public returns (int256) {
        int256 d = b + c;

        if (d < 1) {
            if (b < 3) {
                state1 = true;
                return 1;
            }

            if (a == 42) {
                state2 = true;
                return 2;
            }
    
            state3 = true;
            return 3;
        } else {
            if (c < 42) {
                state4 = true;
                return 4;
            }
            state5 = true;
            return 5;
        }
    }
}