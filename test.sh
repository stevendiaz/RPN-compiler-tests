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


#Make sure to adjust loop when adding tests
for i in `seq 15 34`;
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

#Run tests
./tester15
echo ANSWER: 450
/tester16
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

#Delete extraneous test files
rm error*
rm output*
rm tester*
