import ballerina/test;

@test:Config
function testTheSoundFor1Is1() {
    test:assertEquals(convert(1), "1");
}

@test:Config {}
function testTheSoundFor3IsPling() {
    test:assertEquals(convert(3), "Pling");
}

@test:Config {}
function testTheSoundFor5IsPlang() {
    test:assertEquals(convert(5), "Plang");
}

@test:Config {}
function testTheSoundFor7IsPlong() {
    test:assertEquals(convert(7), "Plong");
}

@test:Config {}
function testTheSoundFor6IsPlingAsItHasAFactor3() {
    test:assertEquals(convert(6), "Pling");
}

@test:Config {}
function testNumber2ToThePower3DoesNotMakeARaindropSoundAs3IsTheExponentNotTheBase() {
    test:assertEquals(convert(8), "8");
}

@test:Config {}
function testTheSoundFor9IsPlingAsItHasAFactor3() {
    test:assertEquals(convert(9), "Pling");
}

@test:Config {}
function testTheSoundFor10IsPlangAsItHasAFactor5() {
    test:assertEquals(convert(10), "Plang");
}

@test:Config {}
function testTheSoundFor14IsPlongAsItHasAFactorOf7() {
    test:assertEquals(convert(14), "Plong");
}

@test:Config {}
function testTheSoundFor15IsPlingplangAsItHasFactors3And5() {
    test:assertEquals(convert(15), "PlingPlang");
}

@test:Config {}
function testTheSoundFor21IsPlingplongAsItHasFactors3And7() {
    test:assertEquals(convert(21), "PlingPlong");
}

@test:Config {}
function testTheSoundFor25IsPlangAsItHasAFactor5() {
    test:assertEquals(convert(25), "Plang");
}

@test:Config {}
function testTheSoundFor27IsPlingAsItHasAFactor3() {
    test:assertEquals(convert(27), "Pling");
}

@test:Config {}
function testTheSoundFor35IsPlangplongAsItHasFactors5And7() {
    test:assertEquals(convert(35), "PlangPlong");
}

@test:Config {}
function testTheSoundFor49IsPlongAsItHasAFactor7() {
    test:assertEquals(convert(49), "Plong");
}

@test:Config {}
function testTheSoundFor52Is52() {
    test:assertEquals(convert(52), "52");
}

@test:Config {}
function testTheSoundFor105IsPlingplangplongAsItHasFactors35And7() {
    test:assertEquals(convert(105), "PlingPlangPlong");
}

@test:Config {}
function testTheSoundFor3125IsPlangAsItHasAFactor5() {
    test:assertEquals(convert(3125), "Plang");
}
