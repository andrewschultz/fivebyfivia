# sols.py: reads sols.txt and outputs graphics for various puzzles and solutions for Fivebyfivia

import mytools as mt
import sys
import os
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
import chesshtmstubs as ch

WHITE_KING = 0
BLACK_KING = 1
WHITE_QUEEN = 2
WHITE_ROOK = 3

piece_to_icon = [ (0, 0), (0, 1), (1, 0), (2, 0) ]

this_html_out = 'html\\graphic-solutions.htm'

tour_board = "tour-board.png"

def write_one_graphic(placements, prefix): # king = 0 bishop = 3 knight = 4
    background = Image.open(ch.blank_board).convert("RGBA")
    foreground = Image.open(ch.chess_icons)

    h_delta = 60
    v_delta = 60

    for x in placements:
        icon_h = piece_to_icon[x[0]][0]
        icon_v = piece_to_icon[x[0]][1]
        this_h = x[1]
        this_v = x[2]
        foreground_temp = foreground.crop((icon_h * h_delta, icon_v * v_delta, (icon_h + 1) * h_delta, (icon_v + 1) * v_delta)).convert("RGBA")
        background.paste(foreground_temp, (60 * this_h + 20, 60 * this_v + 20), foreground_temp)

    #background.paste(foreground, (0, 0), foreground)
    out_file_full = "html\\{}.png".format(prefix)
    out_file = "{}.png".format(prefix)
    try:
        background.save(out_file_full)
    except:
        sys.exit("Could not create {}. Make sure the html directory exists.".format(out_file_full))
    ch.one_image_link(out_file)

def write_tour_graphic(prefix, data_array):
    img = Image.open(tour_board)
    draw = ImageDraw.Draw(img)
    for x in range(0, 25):
        msg = str(data_array[x])
        arial = ImageFont.truetype("arial.ttf", 40)
        (w,h) = arial.getsize(msg)
        x_start = 60 * (x % 5)
        y_start = 60 * (x // 5)
        draw.text((x_start + (60 - w) // 2, y_start + (60 - h) // 2), msg, font = arial, fill = "green" if int(data_array[x]) <= 17 else "red")
    out_file_full = "html/{}.png".format(prefix)
    out_file = "{}.png".format(prefix)
    try:
        img.save(out_file_full)
    except:
        sys.exit("Could not create {}. Make sure the html directory exists.".format(out_file))
    ch.one_image_link(out_file)

cmd_count = 1

while cmd_count < len(sys.argv):
    arg = mt.nohy(sys.argv[cmd_count])
    if arg == 'w':
        ch.html_out = this_html_out
    elif arg == 'a':
        open_main_html = True
    else:
        sys.exit("Use W as a command line argument to write to {} or a to launch that file in Chrome.".format(this_html_out))
    cmd_count += 1

ch.write_header(ch.html_out)

with open ("sols.txt") as file:
    for (line_count, line) in enumerate (file, 1):
        (prefix, data) = mt.cfg_data_split(line)
        if '/' not in data:
            write_tour_graphic(prefix, data.split(','))
            continue
        placements = [ [ int(y) for y in x.split(',') ] for x in data.split('/') ]
        write_one_graphic(placements, prefix)

ch.write_footer(ch.html_out)


if open_main_html or ch.html_out == this_html_out:
    mt.browser_or_native(this_html_out, my_browser = 'c')
else:
    mt.browser_or_native(ch.html_out, my_browser = 'c')
