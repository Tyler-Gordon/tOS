#include "stdio.h"
#include "fb.h"

void write(char *s,int line, ...)
{
    int cursor_pos = 0;
    char *p;
    int line_multiply = line * 160;
    for (p=s; *p !='\0'; ++p)
    {
        if (*p != '%')
        {
            int cell = cursor_pos;
            fb_write_cell(cell * 2 + line_multiply, *p, 0, 2);
            fb_move_cursor(line_multiply / 2 + cell + 1);
        }       
        cursor_pos++;
    }
}

