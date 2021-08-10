
html_out = "generic-name.html"

def write_header(my_file):
    print(my_file)
    f = open(my_file, "w")
    f.write("<html>\n<body bgcolor=cccccc>\n")
    f.close()

def write_footer(my_file):
    print(my_file)
    f = open(my_file, "a")
    f.write("</body>\n</html>\n")
    f.close()

