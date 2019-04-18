#include "stdio.h"
#include "fb.h"

void kmain()
{
    char string[] = "THIS IS TOS    ";
    write(string, 0);
    char newstring[] = "LOL";
    write(newstring, 1);
}
