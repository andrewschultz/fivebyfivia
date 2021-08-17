import re

prev_sect = ""
html_out = "generic-name.html"

board_outline = "c:/Users/Andrew/Documents/github/fivebyfivia/utils/board-outline.png"
blank_board = "c:/Users/Andrew/Documents/github/fivebyfivia/utils/blank-board.png"
chess_icons = "c:/users/andrew/documents/github/fivebyfivia/utils/freeserif.png"

def one_image_link(graphic_file, sect_abbr = '', full_sect_name = ''):
    if not sect_abbr:
        sect_abbr = re.sub('-.*', '', graphic_file)
    global prev_sect
    close_tag = False
    f = open(html_out, "a")
    if not prev_sect or prev_sect != sect_abbr:
        if prev_sect and prev_sect != sect_abbr:
            f.write("</center>\n")
            f.write("<hr>\n")
            f.write('<div style="page-break-before: always;">\n')
            close_tag = True
        f.write('<center><font size=+2>{}</font></center>\n'.format(full_sect_name if full_sect_name else sect_abbr))
        prev_sect = sect_abbr
        if close_tag:
            f.write("</div>\n")
        f.write("<center>\n")
    f.write("<img src = {}>\n".format(graphic_file))
    f.close()

def write_header(my_file):
    f = open(my_file, "w")
    f.write("<html>\n<body bgcolor=cccccc>\n")
    f.close()

def write_footer(my_file):
    f = open(my_file, "a")
    f.write("</center>\n</body>\n</html>\n")
    f.close()

