
library(rmarkdown)
library(yaml)

## md_bullet turns a vector in a markdown formated list
md_bullet<-function(x) cat(paste('-', x), sep = '\n') 

## extract YAML metata from a file and adds some additional fields
yaml_extract=function(file){
  yaml=scan(file,what = "char",skip=1,sep="\n",quiet = T)
  #yaml2=paste(yaml[1:(which(yaml=="---")-1)],collapse="\n")
  yaml2=paste(yaml[1:((which(yaml=="---")[1])-1)])
  yaml3=read_yaml(text=yaml2)
  yaml3$file=file
  yaml3$name=sub("[.]Rmd","",basename(file))
  yaml3$url=paste(sub("[.]Rmd",".html",yaml3$file))
  return(yaml3)
}

## Extract YAML from an entire directory
yaml_dir=function(files=NULL,dir=NULL,recursive=F){
  if(!is.null(dir)) files=c(
    list.files(dir,pattern="^CS.*Rmd$",full=T,recursive = recursive),
    list.files(dir,pattern="^TK.*Rmd$",full=T,recursive = recursive),
    list.files(dir,pattern="^PS.*Rmd$",full=T,recursive = recursive))
  if(is.null(files)&is.null(dir)) files=c(
    list.files(pattern="^CS.*Rmd$",full=T,recursive = recursive),
    list.files(pattern="^TK.*Rmd$",full=T,recursive = recursive),
    list.files(pattern="^PS.*Rmd$",full=T,recursive = recursive))
  lapply(files,FUN=yaml_extract)
}

ftask2=function(x) {
  tyaml=yaml_extract(paste0(x,".Rmd"))[c("title","url")]
  paste0("[",tyaml$title,"](",tyaml$url,")")
}

ftask=function(x) {
  if(is.na(x)) return(NA)
  sapply(x,ftask2)
}

fpres=function(x) {
  if(is.na(x)) return(NA) 
  paste0( "[<i class='fas fa-desktop'>    </i>](presentations/",x,"){target='_blank'}")
}
