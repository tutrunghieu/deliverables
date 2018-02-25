renderPage <- function(df, fn) {
df <- df[, c("names", "label")];
df$fnames <- as.character(df$names);
# print(head(df));

g <- split(df, df$label);

sink(file=fn);

for(j in names(g)) {
 cat("<h1>Group ", j, "</h1>\n");
 df <- g[[j]];

 for(k in 1:nrow(df))
   cat("<img src='../data-MITSE-2001/", df$fnames[k], "' width=64px> ", sep="");
}

sink(file=NULL);
}
