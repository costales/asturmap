#!/usr/bin/python3

import sys
import xml.etree.ElementTree as xml

def osm_xml_parser(path_to_file):
    # Parse OSM file
    e = xml.parse(path_to_file).getroot()
    for i in e: # node
        exist_ast = False
        name_regular = False
        name_ast = ""
        # Exist name:ast?
        for j in i: # tag
            if 'k' in j.attrib and j.attrib["k"] == "name:ast" and 'v' in j.attrib:
                name_ast = j.attrib["v"]
        # If exist then change name by name:ast
        if name_ast:
            for j in i: # tag
                if 'k' in j.attrib and 'v' in j.attrib and j.attrib["k"] == "name":
                    j.set('v', name_ast)
    # Print
    print(xml.tostring(e, 'utf-8'))

# Specify the path to the OSM-XML file and call the parser.
graph = osm_xml_parser(sys.argv[1])
