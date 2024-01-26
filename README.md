# Switch between number bases

Create a function that is given a number, input base and output base return a
number in the output base. The input number is passed as a string so that it
isn't interpreted as base 10 by default. The output will also be a string, for
the same reason.

## Example:

    convertNumber("11",2,10)

would return "3", which is the decimal version of the binary input.

    convertNumber("27",10,16)

would return "1B".

It's up to you if you want to use any libraries to perform this, but I expect
you might get higher scores for implementing it yourself.

If you want to limit the bases you handle, that is fine as long as your program
handles this in a user-friendly way (though don't expect high marks if you only
support a very limited set).

## NOTES:

  * you can't rely on the input being valid
  * hexidecimal (and other bases that use letters) prefer uppercase input and
    output
