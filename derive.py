import sys, getopt

def create_Dictionary(inputfile):
   retDict = dict()
   for line in open(inputfile, 'r'):
      lineArray = line.split()
      key = lineArray[0]
      valueToAdd = ""
      for string in lineArray[2:]:
         valueToAdd += string
      if key in retDict:
         retDict[key] = [retDict[key], valueToAdd]
      else:
         retDict[key] = valueToAdd
      print(retDict)

   return retDict

def main(argv):
   inputfile = ''
   length = 3
   steps = 0
   try:
      opts, args = getopt.getopt(argv, "l:", ["length =", "file"])
   except: 
      print("Error With Argument")
      exit(1)
   for opt, arg in opts:
      if opt in ['-l', '--length']:
         length = arg  
      else:
         print("Invalid Argument")
         exit(1)
   inputfile = args[0]
   cfgDict = create_Dictionary(inputfile)





main(sys.argv[1:])   