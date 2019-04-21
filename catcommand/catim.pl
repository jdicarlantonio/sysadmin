#!/usr/bin/perl

$num_args = $#ARGV + 1;
if($num_args < 1)
{
    print "Error: Expected arguments.\n";
    exit;
}

$file_contents = "";
for($i = 0; $i < $num_args; $i = $i + 1)
{
    $file_name = "<${ARGV[$i]}";
    open(DATA, $file_name) || warn "File: $file_name> does not exist\n";
    while(<DATA>)
    {
        $file_contents = $file_contents."$_";
    }
}

print "$file_contents";
