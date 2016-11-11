
##### ext.sh - mass addition/removal/toggling of file extensions
   
Usage: 

    ext.sh a|r extension FILE [FILE...] # add/remove extension
    ext.sh t FILE [FILE...] # toggle .bak extension

  Example: 
    
    ext.sh a .ext file  # Moves file to file.ext

  Example: 
  
    ext.sh r .ext file.ext  # Moves file.ext to file

  Example: 
  
    ext.sh t file   # Moves file to file.bak

  Example: 
  
    ext.sh t file.bak   # Moves file.bak to file



##### Todo list:

fix files being moved into folders that already exist
if t is called with file and file.bak, swap them

