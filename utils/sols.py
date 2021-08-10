import mytools as mt
import sys
import os
import re
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw

WHITE_KING = 0
BLACK_KING = 1
WHITE_QUEEN = 2
WHITE_ROOK = 3

piece_to_icon = [ (0, 0), (0, 1), (1, 0), (2, 0) ]

prev_sect = ''
html_out = 'html\\visual.htm'

tour_board = "tour-board.png"

def write_one_graphic(placements, prefix): # king = 0 bishop = 3 knight = 4
    background = Image.open("c:/Users/Andrew/Documents/github/fourbyfourian-quarryin/utils/blank-board.png")
    foreground = Image.open("c:/Users/Andrew/Documents/github/fourbyfourian-quarryin/utils/freeserif.png")

    h_delta = 58
    v_delta = 82

    h_size = 55
    v_size = 54

    for x in placements:
        icon_h = piece_to_icon[x[0]][0]
        icon_v = piece_to_icon[x[0]][1]
        this_h = x[1]
        this_v = x[2]
        print(icon_h, icon_v, this_h, this_v)
        print(this_h * h_delta, this_v * v_delta, (this_h + 1) * h_delta, (this_v + 1) * v_delta)
        foreground_temp = foreground.crop((icon_h * h_delta, icon_v * v_delta, (icon_h + 1) * h_delta, (icon_v + 1) * v_delta)).convert("RGBA")
        background.paste(foreground_temp, (60 * this_h + 3, 60 * this_v + 3), foreground_temp)

    #background.paste(foreground, (0, 0), foreground)
    out_file_full = "html\\{}.png".format(prefix)
    out_file = "{}.png".format(prefix)
    try:
        background.save(out_file_full)
    except:
        sys.exit("Could not create {}. Make sure the html directory exists.".format(out_file_full))
    f = open(html_out, "a")
    global prev_sect
    if prev_sect not in out_file or not prev_sect:
        if prev_sect:
            f.write("</center>\n")
            f.write("<hr>\n")
        prev_sect = re.sub('-.*', '', out_file)
        f.write('<div style="page-break-before: always;"><center><font size=+2>{}</font></center>\n<center></div>\n'.format(prev_sect))
    f.write("<img src = {}>\n".format(out_file))
    f.close()

def write_tour_graphic(prefix, data_array):
    img = Image.open(tour_board)
    draw = ImageDraw.Draw(img)
    font = ImageFont.truetype("arial.ttf", 16)
    for x in range(0, 25):
        draw.text((60 * (x // 5) + 20, 60 * (x % 5) + 20),data_array[x],(255,0,0),font=font)
    out_file_full = "html/{}.png".format(prefix)
    out_file = "{}.png".format(prefix)
    try:
        img.save(out_file_full)
    except:
        sys.exit("Could not create {}. Make sure the html directory exists.".format(out_file))
    f = open(html_out, "a")
    global prev_sect
    if prev_sect not in out_file or not prev_sect:
        if prev_sect:
            f.write("</center>\n")
            f.write("<hr>\n")
        prev_sect = re.sub('-.*', '', out_file)
        f.write("<center><font size=+2>{}</font></center>\n<center>\n".format(prev_sect))
    f.write("<img src = {}>\n".format(out_file))
    f.close()

f = open(html_out, "w")
f.write("<html>\n<body bgcolor=cccccc>\n")
f.close()

with open ("sols.txt") as file:
    for (line_count, line) in enumerate (file, 1):
        (prefix, data) = mt.cfg_data_split(line)
        if '/' not in data:
            write_tour_graphic(prefix, data.split(','))
            continue
        placements = [ [ int(y) for y in x.split(',') ] for x in data.split('/') ]
        write_one_graphic(placements, prefix)

os.system(html_out)
