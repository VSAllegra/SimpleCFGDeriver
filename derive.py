from ast import Str
from asyncio.windows_events import NULL
import sys, getopt

# param string: String that is being checked in worklist
def getWeight(string):
   weight = len((string.split(' '))) #Gets "Size" of s for checking if its the correct length
   return weight #String is seperated with spaces to allow spliting into a list

# param cfgDict : Dictionary with Nonterminal -> Terminal Mapping
# param length : Length Limit for resulting strings
def find_combinations(cfgDict, length):
   comboSet = set() #Set so no dupes
   worklist = [list(cfgDict.keys())[0]] #Need our initial NonTerminal
   while worklist: #worklist isn't empty
      stringToModify = worklist.pop(0) #take out the first string to look at
      curlen = getWeight(stringToModify) #get its weight
      if curlen > length: #if its over skip to next string
         continue
      containsAllTerminal = True #Used for storing whether there is still a nonterminal in the string
      for key in cfgDict: 
         if(key in stringToModify): #keys are NonTerminals
            containsAllTerminal = False
            for value in cfgDict.get(key):
               worklist.append(stringToModify.replace(key, value, 1)) #append all possible strings
      if curlen == length: #string is correct length
         if(containsAllTerminal): #string is all terminals
            comboSet.add(stringToModify) 
   setList = list(comboSet)
   setList.sort()
   for combo in setList:
      print(combo)
   print("\n# of strings generated: " + str(len(setList)) + "\n")
 
# param inputfile: file to get the cfg from
def create_Dictionary(inputfile):
   retDict = dict()
   try:
      file = open(inputfile, 'r')
   except: 
      print("File " + inputfile + "Not Found") 
      exit(1)
   for line in file:
      lineArray = line.split()
      key = lineArray[0]
      if not (key in retDict):
         retDict[key] = []
      retDict[key].append(' '.join(lineArray[2:]))
   return retDict

def main(argv):
   inputfile = ''
   length = 3
   try:
      opts, args = getopt.getopt(argv, "l:", ["length ="])
   except: 
      print("Error With Argument")
      exit(1)
   for opt, arg in opts:
      if opt in ['-l', '--length']:
         try:
            length = int(arg)
         except:
            print("-l Must be followed by integer")
            exit(1)
   if len(args) == 0:
         print("Arguments must Include File Name")
         exit(1)
   inputfile = args[0]
   cfgDict = create_Dictionary(inputfile)
   find_combinations(cfgDict, length)

if __name__ == "__main__":
   main(sys.argv[1:])   
