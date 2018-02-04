rm(list = ls());
set.seed(197);


main <- function() {
 wf <- paste0(Sys.getenv("USERPROFILE"),"/Desktop/data");
 items <- list.files(wf); 
 print(data.frame(F1=items));


 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
