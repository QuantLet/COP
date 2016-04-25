# load packages
#install.packages("RCurl")
library(RCurl)
library(XML)

sPathRoot = "C:/Users/Christoph/Documents/GitHub/Copulae"
setwd(sPathRoot)
# assign input (could be a html file, a URL, html text, or some combination of all three is the form of a vector)
input = "http://quantlet.org/index.php?p=show&id=2581"
input = "http://quantlet.org/index.php?p=searchResults&w=project&id=312)"

# evaluate input and convert to text
txt = htmlToText(input)
txt

Quantlets = c("COP3contourandcop", "COPapp1prices", "COPapp1residual", "COPapp1return", "COPcorrelation1",
              "COPcorrelation2", "COPdaxhistogram", "COPdaxnormhist", "COPdaxreturn", "COPdaxreturnhist", "COPdaxtimeseries",
              "COPdensitydaxreturn", "COPhac3dscatter1", "COPhac3dscatter2", "COPhac4firmsscatter", "COPhac4firmstree3", "COPhac4firmstree4",
              "COPhac4firmstree5", "COPhac4firmstree6", "COPhac5pp", "COPhac5varsmpscatter", "COPhelperfunctions", "COPlcpeinaparch", "COPlcpexVaR",
              "COPlcpexgarch", "COPlcpexres", "COPlcpinVaR", "COPlcpinres")

# create directories
lapply(Quantlets, dir.create)

# create R files
QuantletsRFiles = cbind(Quantlets, rep("/", length(Quantlets)), Quantlets, rep(".r", length(Quantlets)))

for(iCounter in 1:nrow(QuantletsRFiles)){
  
}
# create meta file
download.file("getDownload.php?a=quantlet&id=2581&name=COP3contourandcop&type=R", , method, quiet = FALSE, mode = "w",
              cacheOK = TRUE,
              extra = getOption("download.file.extra"))

