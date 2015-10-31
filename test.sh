make compiler

#ERRORS
#Place tests that should give errors in this section
./compiler x y z + + + > error1.s
echo SHOULD BE ERROR
./compiler z y x + + "*" > error2.s
echo SHOULD BE ERROR
./compiler fsa 21x 3 + - > error3.s
echo SHOULD BE ERROR
./compiler 1 0 + 12 > error4.s
echo SHOULD BE ERROR
./compiler + 2 2 > error5.s
echo SHOULD BE ERROR
./compiler 9 1 2 / / > error6.s
echo SHOULD BE ERROR
./compiler 2 + 2 > error7.s
echo SHOULD BE ERROR
./compiler 3 3 + + > error8.s
echo SHOULD BE ERROR
./compiler x21 3 + > error9.s
echo SHOULD BE ERROR
./compiler -12xD 3 + > error10.s
echo SHOULD BE ERROR
./compiler 3 4 4 2 + > error11.s
echo SHOULD BE ERORR
./compiler + > error12.s
echo SHOULD BE ERROR
./compiler a > error13.s
echo SHOULD BE ERROR
./compiler 4 + > error14.s
echo SHOULD BE ERROR

#PASSING TESTS
#Place tests that should pass in here
echo
echo Variables, X:1 Y:2 Z:3
./compiler 50 50 50 50 50 50 50 50 50 + + + + + + + + > output15.s
./compiler x x x y y y z z z + + + + + + + + > output16.s
./compiler 2 5 '*' 3 + > output17.s
./compiler 1 2 + 3 + 4 + 5 + 6 + 7 + > output18.s
./compiler 3 4 5 + '*' > output19.s
./compiler 10 2 8 '*' + 3 - > output20.s
./compiler 2147483647 2147483647 2147483647 + + > output21.s
./compiler 9223372036854775807 9223372036854775807 + > output22.s
./compiler 9223372036854775807 1 + > output23.s
./compiler -9223372036854775808 -9223372036854775808 + > output24.s
./compiler -11 -11 '*' > output25.s
./compiler 5 6 - 12 3 + '*' 2 - > output26.s
./compiler 3 2 + 17 4 - '*' > output27.s
./compiler 1 1 + > output28.s
./compiler 3 4 7 + "*" > output29.s
./compiler 8 9 + 4 3 10 "*" + "*" 5 - > output30.s
./compiler 1 2 3 4 + + + > output31.s
./compiler 1 2 3 4 "*" - 5 6 7 + + - "*" 8 9 "*" + > output32.s
./compiler x y z + + > output33.s
./compiler z y x + + > output34.s
./compiler 0 0 0 "*" "*" 0 0 0 "*" "*" 0 0 0 "*" "*" "*" "*" > output35.s
./compiler 0 0 + 0 0 0 "*" + "*" 0 - > output36.s
./compiler 0 0 0 0 0 + + - * 0 0 0 0 0 - - + + 0 0 0 0 0 * + + - - - - > output37.s
./compiler 1 1 1 * * 1 1 1 * * 1 1 1 * * * * > output38.s
./compiler 1 1 + 1 1 1 * + * 1 - > output39.s
./compiler 1 1 1 1 1 + + - * 1 1 1 1 1 - - + + 1 1 1 1 1 * + + - - - - > output40.s
./compiler -1 -1 -1 * * -1 -1 -1 * * -1 -1 -1 * * * * > output41.s
./compiler -1 -1 + -1 -1 -1 * + * -1 - > output42.s
./compiler -1 -1 -1 -1 -1 + + - * -1 -1 -1 -1 -1 - - + + -1 -1 -1 -1 -1 * + + - - - > output43.s
./compiler 86457 86457 86457 * * 86457 86457 86457 * * 86457 86457 86457 * * * * > output44.s
./compiler 86457 86457 + 86457 86457 86457 * + * 86457 - > output44.s
./compiler 86457 86457 86457 86457 86457 + + - * 86457 86457 86457 86457 86457 - - + + 86457 86457 86457 86457 86457 * + + - - - > output45.s
./compiler 86457 86457 + 86457 86457 86457 * + * 86457 - > output46.s
./compiler -348901 -348901 -348901 * * -348901 -348901 -348901 * * -348901 -348901 -348901 * * * * > output47.s
./compiler -348901 -348901 + -348901 -348901 -348901 * + * -348901 - > output48.s
./compiler -348901 -348901 -348901 -348901 -348901 + + - * -348901 -348901 -348901 -348901 -348901 - - + + -348901 -348901 -348901 -348901 -348901 * + + - - - > output49.s

#Make sure to adjust loop when adding tests
for i in `seq 15 49`;
do
    as --64 output$i.s
done

#Compiles all the valid passing test code
gcc -o tester15 test.c output15.s
gcc -o tester16 test.c output16.s
gcc -o tester17 test.c output17.s
gcc -o tester18 test.c output18.s
gcc -o tester19 test.c output19.s
gcc -o tester20 test.c output20.s
gcc -o tester21 test.c output21.s
gcc -o tester22 test.c output22.s
gcc -o tester23 test.c output23.s
gcc -o tester24 test.c output24.s
gcc -o tester25 test.c output25.s
gcc -o tester26 test.c output26.s
gcc -o tester27 test.c output27.s
gcc -o tester28 test.c output28.s
gcc -o tester29 test.c output29.s
gcc -o tester30 test.c output30.s
gcc -o tester31 test.c output31.s
gcc -o tester32 test.c output32.s
gcc -o tester33 test.c output33.s
gcc -o tester34 test.c output34.s
gcc -o tester35 test.c output35.s
gcc -o tester36 test.c output36.s
gcc -o tester37 test.c output37.s
gcc -o tester38 test.c output38.s
gcc -o tester39 test.c output39.s
gcc -o tester40 test.c output40.s
gcc -o tester41 test.c output41.s
gcc -o tester42 test.c output42.s
gcc -o tester43 test.c output43.s
gcc -o tester44 test.c output44.s
gcc -o tester45 test.c output45.s
gcc -o tester46 test.c output46.s
gcc -o tester47 test.c output47.s
gcc -o tester48 test.c output48.s
gcc -o tester49 test.c output49.s


#Run tests
./tester15
echo ANSWER: 450
./tester16
echo ANSWER: 18
./tester17
echo ANSWER: 13
./tester18
echo ANSWER: 28
./tester19
echo ANSWER: 27
./tester20
echo ANSWER: 23
./tester21
echo ANSWER: 6442450941
./tester22
echo ANSWER: -2
./tester23
echo ANSWER: -9223372036854775808
./tester24
echo ANSWER: 0
./tester25
echo ANSWER: 121
./tester26
echo ANSWER: -17
./tester27
echo ANSWER: 65
./tester28
echo ANSWER: 2
./tester29
echo ANSWER: 33
./tester30
echo ANSWER: 573
./tester31
echo ANSWER: 10
./tester32
echo ANSWER: 44
./tester33
echo ANSWER: 6, dependent on variables
./tester34
echo ANSWER: 6, dependent on variables
./tester35
echo ANSWER: 0
./tester36
echo ANSWER: 0
./tester37
echo ANSWER: 0
./tester38
echo ANSWER: 1
./tester39
echo ANSWER: 3
./tester40
echo ANSWER: -7
./tester41
echo ANSWER: -1
./tester42
echo ANSWER: 1
./tester43
echo ANSWER: 1
./tester44
echo ANSWER: -7736030106824560519
./tester45
echo ANSWER: 1292514738511227
./tester46
echo ANSWER: -22424784375
./tester47
echo ANSWER: -1598232911544453957
./tester48
echo ANSWER: -84944525263188899
./tester49
echo ANSWER: -365194327799

#Delete extraneous test files
rm error*
rm output*
rm tester*
