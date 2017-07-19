#!/bin/bash
outputMessage()
{
 echo "outputMessage is start:"
 exec >outfile1 2>&1
 echo "this is outputMessage...."
 echo "faile command:ls abcdefg"
 ls abcdefg
 echo "outputMessage is end"
}

outMessage()
{
 echo "outMessage is start:"
 exec 2>&1>outfile2
 echo "this is out Message..."
 echo "faile command:ls abcdefg"
 ls abcdefg
}
outputMessage
outMessage
