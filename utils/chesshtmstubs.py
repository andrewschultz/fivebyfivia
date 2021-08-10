import re

prev_sect = ""
html_out = "generic-name.html"

def one_image_link(graphic_file):
    global prev_sect
    close_tag = False
    f = open(html_out, "a")
    if not graphic_file.startswith(prev_sect) or not prev_sect:
        if prev_sect:
            f.write("</center>\n")
            f.write("<hr>\n")
            f.write('<div style="page-break-before: always;">\n')
            close_tag = True
        prev_sect = re.sub('-.*', '', graphic_file)
        f.write('<center><font size=+2>{}</font></center>\n'.format(prev_sect))
        if close_tag:
            f.write("</div>\n")
        f.write("<center>\n")
    f.write("<img src = {}>\n".format(graphic_file))
    f.close()

def write_header(my_file):
    print(my_file)
    print(html_out)
    f = open(my_file, "w")
    f.write("<html>\n<body bgcolor=cccccc>\n")
    f.close()

def write_footer(my_file):
    print(my_file)
    f = open(my_file, "a")
    f.write("</center>\n</body>\n</html>\n")
    f.close()

