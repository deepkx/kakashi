SHELL SCRIPTING
1.Write a script to rename current working directory with given name
if [ $# -ne 1 ]; then
    echo "Usage: $0 new_directory_name"
    exit 1
fi

new_name="$1"

# Get the current directory's absolute path
current_dir=$(pwd)

# Get the parent directory
parent_dir=$(dirname "$current_dir")

# Move the current directory to the new name
mv "$current_dir" "$parent_dir/$new_name"

echo "Current working directory renamed to: $new_name"

2.Display the longest and shortest usernames on the system (usernames are in the first field in /etc/passwd. Explore /etc/passwd).
#!/bin/bash

longest=""
shortest=".................................."

while IFS=: read -r username _; do
    if [ ${#username} -gt ${#longest} ]; then
        longest="$username"
    fi

    if [ ${#username} -lt ${#shortest} ]; then
        shortest="$username"
    fi
done < /etc/passwd

echo "Longest username: $longest"
echo "Shortest username: $shortest"

3.Write a shell script that takes a filename as an argument and counts the number of lines, words, and characters in the file. Display these counts along with the filename.
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename="$1"

if [ ! -f "$filename" ]; then
    echo "File not found: $filename"
    exit 1
fi

lines=$(wc -l < "$filename")
words=$(wc -w < "$filename")
characters=$(wc -m < "$filename")

echo "File: $filename"
echo "Number of lines: $lines"
echo "Number of words: $words"
echo "Number of characters: $characters"

4.Create a shell script that reads a list of numbers as arguments and calculates their sum and average. Display the sum and average with appropriate messages.

if [ $# -eq 0 ]; then
    echo "Usage: $0 number1 number2 number3 ..."
    exit 1
fi

sum=0
count=0

for num in "$@"; do
    sum=$((sum + num))
    count=$((count + 1))
done

average=$((sum / count))

echo "Sum of numbers: $sum"
echo "Average of numbers: $average"

5.Write a menu-driven shell script that simulates a basic file management tool. The script should display a menu with the following options:
while true; do
    echo "Menu:"
    echo "1. Create a new file"
    echo "2. Display the content of a file"
    echo "3. Append content to a file"
    echo "4. Search for a string in a file"
    echo "5. Exit"
    echo "Enter your choice: "
    read choice

    case $choice in
        1)
            echo -n "Enter filename: "
            read filename
            touch "$filename"
            echo "File $filename created."
            ;;
        2)
            echo -n "Enter filename: "
            read filename
            if [ -f "$filename" ]; then
                cat "$filename"
            else
                echo "File not found."
            fi
            ;;
        3)
            echo -n "Enter filename: "
            read filename
            if [ -f "$filename" ]; then
                echo -n "Enter content to append: "
                read content
                echo "$content" >> "$filename"
                echo "Content appended to $filename."
            else
                echo "File not found."
            fi
            ;;
        4)
            echo -n "Enter filename: "
            read filename
            if [ -f "$filename" ]; then
                echo -n "Enter search string: "
                read search_string
                grep -n "$search_string" "$filename"
            else
                echo "File not found."
            fi
            ;;
        5)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice! Please select a valid option."
            ;;
    esac
done

SHELL SCRIPTING 
1.Menu Driven program
while true; do
    echo "1.COPY"
    echo "2.RENAME"
    echo "3.REMOVE"
    echo "4.LINK"
    echo "5.EXIT"
    echo "Enter your choice"
    read ch

    case $ch in
        1)
            echo "Enter the source file"
            read s
            echo "Enter the destination file"
            read d
            cp $s $d
            ;;
        2)
            echo "Enter the old file name"
            read of
            echo "Enter the new file name"
            read nf
            mv $of $nf
            ;;
        3)
            echo "Enter file name to delete"
            read df
            rm $df
            ;;
        4)
            echo "Enter the file1"
            read f1
            echo "Enter the file2"
            read f2
            ln $f1 $f2
            ;;
        5)
            exit
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac
done

2.User input starting line ending line and prints the content 
echo "Enter filename: "
read file1

if [ -f "$file1" ]; then
    echo "Enter starting line number:"
    read snum
    echo "Enter ending line number: "
    read enum

    i=1
    while read -r line; do
        if [ $i -ge $snum ] && [ $i -le $enum ]; then
            echo "$line"
        fi
        i=$((i+1))
    done < "$file1"
fi

3.Largest file in the directory… should pass the directory as argument

if [ $# -ne 1 ]; then
    echo -e "\n\nInvalid number of arguments passed\n"
    exit
fi

if [ ! -d "$1" ]; then
    echo -e "\n\nDirectory does not exist\n"
    exit
fi

cd "$1"
echo "The directory name is $1"
largest_file=$(ls -lR | grep -v "^d" | sort -k5nr | head -n 1)
echo "Largest file: $largest_file"

4.To check if permissions of 2 files are same or different

if [ $# -ne 2 ]; then
    echo "Pass 2 arguments"
    exit
fi

p1=$(ls -l "$1" | cut -c 2-10)
p2=$(ls -l "$2" | cut -c 2-10)

if [ "$p1" = "$p2" ]; then
    echo "Permissions are the same"
    echo "$p1"
else
    echo "Permissions are different"
    echo "Permission of file $1 is $p1"
    echo "Permission of file $2 is $p2"
fi
5.Takes strings in arguments and prints them in reverse
#!/bin/bash

a=$#
echo "Number of arguments are" $a
c=$a
res=''

while [ $c -ge 1 ]; do
    res="$res ${!c}"
    c=$((c - 1))
done

echo "Arguments in reverse order: $res"

6.Takes pattern alone or pattern and filenames as arguments and prints where the pattern in matching

pattern="$1"
shift

if [ $# -eq 0 ]; then
    grep -n "$pattern" *
else
    for file in "$@"; do
        if [ -f "$file" ]; then
            grep -n "$pattern" "$file"
        else
            echo "File $file not found."
        fi
    done
fi


Simple Shell Scripts
1. Write a shell script to accepttwo file names and check if both exists.If the second
filename exists, then the contents of the first filename should be appended to it. If the
second file name does not existthen create a new file with the contents of the firstfile.
echo"EnterFirstfilename" read file1
echo " Enter Second file name" read file2
if [ -e $file1 ] then
 cat $file1 >> $file2
else
 echo " $file1 does not exist"
fi
echo " $file1 content:" cat $file1
echo " $file2 content:" cat $file2
2. Write a shell script that accepts a file name, starting and ending line numbers as
arguments and displays all the lines between the given line numbers.
echo " Enter the file name :"
read file
if [ -f $file ] then
 echo "Enter the Starting linenumber:"
 read snum
 echo "Enter theEnding linenumber:"
 read enum
 if [ $snum -lt $enum ]
 then
 echo "The selected lines from $snum line to $enum line in $file :"
 sed -n ' '$snum','$enum''p'' $file
 else
 echo "Enter proper starting & ending line numbers."
 fi
else
 echo "The file ' $file ' doesn't exists. "
fi
3. Write an interactive file-handling shell program. Let it offer the user the
choice of copying, removing, renaming, or linking files. Once the user has made
a choice, have the program ask the user for the necessary information, such as
the file name and so on.
echo "1.COPY"
echo "2.RENAME"
echo "3.REMOVE"
echo "4.LINK"
echo "5.EXIT"
echo "Enter your choice"
read ch
case $ch in
1) echo "Enter the sources file"
 read s
 echo "Enter the destination file " read d
 cp $s $d
 ;;
2) echo "Enter the old file name"
 read of
 echo "enter the new file name"
 read nf
 mv $of $nf
 ;;
3) echo "Enter file name to delete"
 read $df
 rm $df
 ;;
4) echo "Enter the file1"
 read f1
 echo "enter the file2"
 read f2
 ln $f1 $f2
 ;;
5) exit
 ;;
esac
4. Write a shell script that accepts one or more file name as arguments and
converts all of them to uppercase, provided they exist in the current directory.
for i in $*
do
 if [ ! -f $i ]
 then
 echo "Filename $fileName does not exists"
 exit
 fi
 # convert uppercase to lowercase using tr command
 tr '[A-Z]' '[a-z]' < $i
done
5. Write a shell script that takes a valid directory name as an argument and
recursively descend all the subdirectories, finds the largest file in the directory
clear
if [ $# -ne 1 ]
then
 echo –e “\n\nInvalid Number of arguments passed\n”
 exit
fi
cd $1
echo The directory name is $1
set -- ` ls -lR| grep -v "^d" |sort +4 -5 -rn`
echo "size of the largest file is $5 blocks"
6. Write a shell script that accepts two file names as arguments, checks if the
permissions for these files are identical and if the permissions are identical,
output common permissions and otherwise output each file name followed by its
permissions.
if [ $# -ne 2 ] then
 echo "pass 2 argument"
 exit
fi
p1=`ls -l $1 | cut -c 2-10`
p2=`ls -l $2 | cut -c 2-10`
if [ $p1 = $p2 ]
then
 echo permissions are same
 echo $p1
else
 echo permissions are different
 echo permission of file $1 is $p1
 echo permission of file $2 is $p2
fi
7. Write a non-recursive shell script which accepts any number of arguments
and prints them in the reverse order (for example, if the script is named rags,
then executing rags ABC should produce CBA on the standard output)
a=$#
echo "Number of arguments are" $a
x=$*
c=$a
res=''
while [ 1 -le $c ]
do
 c=`expr $c - 1`
 shift $c
 res=$res' '$1
 set $x
done
echo Arguments in reverse order $res
