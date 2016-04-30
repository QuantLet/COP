# load packages
# install.packages("RCurl")
library(RCurl)
library(XML)

sMACorWIN = "WIN"
sPathRootWIN = "C:/Users/Christoph/Documents/Gitlab/Copulae/"
sPathRootMAC = "/Users/christophschult/Gitlab/Copulae/"
sReadFile = "Metainfo.txt"

if(sMACorWIN == "MAC"){
  sPathRoot = sPathRootMAC
}else{
  sPathRoot = sPathRootWIN}

# set working directory
setwd(sPathRoot)
readkey = function()
{
  cat ("Press [enter] to continue")
  line = readline()
}

lDirectories = dir(sPathRoot, full.names = TRUE, pattern = "COP")


iCounter = 1

while(iCounter <= length(lDirectories)){
setwd(lDirectories[iCounter]) 
metainfo = file.edit("Metainfo.txt")
print(iCounter)
readkey()
iCounter = iCounter + 1}
  