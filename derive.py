from ast import Str
import sys, getopt
   

def find_combinations(cfgDict, length):
   comboSet = set()
   worklist = [list(cfgDict.keys())[0]]
   while worklist:
      stringToModify = worklist.pop(0)
      curlen = len(stringToModify)
      if curlen > length:
         continue
      containsAllTerminal = True
      for key in cfgDict:
         if(key in stringToModify):
            containsAllTerminal = False
            for value in cfgDict.get(key):
               if(value != key):
                  worklist.append(stringToModify.replace(key, value, 1))
      if curlen == length:
         if(containsAllTerminal):
            comboSet.add(stringToModify) 
   setList = list(comboSet)
   setList.sort()
   for string in setList:
      for char in string:
         print(char + " ", end = ' ')
      print(' ')
   


   


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
         length = int(arg)
      else:
         print("Invalid Argument")
         exit(1)
   inputfile = args[0]
   cfgDict = create_Dictionary(inputfile)
   find_combinations(cfgDict, length)
   





main(sys.argv[1:])   
