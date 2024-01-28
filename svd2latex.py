import xml.etree.ElementTree as ET

def getStr(node, name):
  return node.find(name).text

def latexEscape(str):
  return str.replace("_", "\\_").replace("^", "\\^")

print("hello")
f = open("peripheral_overview.tex", "w")
f2 = open("peripheral_details.tex", "w")

tree = ET.parse('undocumented.svd')
root = tree.getroot()
# root.find() is not recursive
print(root)
peripherals = root.find("peripherals")
for peri in peripherals.findall("peripheral"):
  addr = getStr(peri, "baseAddress")
  name = getStr(peri, "name")
  print(addr)
  print(peri)
  f.write("{} & TODO & TODO & {}\\\\\n".format(addr, latexEscape(name)))
  f2.write("{} details\\\\\n".format(latexEscape(name)))
  regs = peri.find("registers")
  if regs:
    f2.write("registers\\\\\n")
    f2.write("\\begin{tabular}{c c c}\n")
    for reg in regs.findall("register"):
      offset = getStr(reg, "addressOffset")
      name = getStr(reg, "name")
      description = getStr(reg, "description")
      print(name);
      f2.write("{} & {} & {} \\\\\n".format(offset, latexEscape(name), latexEscape(description)))
    f2.write("\\end{tabular}\n")

f.close()
f2.close()
