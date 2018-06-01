# We will use the inbuilt dataset "quakes", which is something to do with earthquakes

str(quakes)  # let's find out what this object quakes is
head(quakes)  # let's have a look at the top section of the data
nrow(quakes)  # number of rows/ how many earthquakes are recorded
quakes[50, ]  # select row 50
quakes[50, 4]  # select row 50, column 4
quakes[50, "mag"]  # select row 50, column 4
quakes[50:55, ]  # select rows 50 to 55
unique(quakes$mag)  # what are all the different possible  values of magnitude
quakes[ , "mag"] == 4.9  # returns logical vector, TRUE when mag is 4.9, FALSE otherwise

# now we want to create a subset of quakes where mag = 4.9
# We row subset the dataframe quakes based on where mag (a column) is 4.9
sub_df <- quakes[quakes[ , "mag"] == 4.9, ]
nrow(sub_df)
sub_df[36:49,] 


# now we want a subset of all quakes that are a 6.0
sub_df2 <- quakes[quakes[ , "mag"] == 6.0, ]
nrow(sub_df2)
sub_df2


####################################################################
#  subsetting the data using a function

# df:  a dataframe object
# df_col: the column that we are going to base the subsetting on
# subset_value: the value that we want to subset on

#  deparse(substitute()) allows you to pass an unevaluated expression and then 
#  turn it into a character string.  It is necessary here for the function to work correctly.
####################################################################


sub_df <- function( df, df_col, subset_value){
  column <- df[ , deparse(substitute(df_col))] 
  sub_df <- df[column == subset_value, ]
  
  return(sub_df)
  
}

sub_df(df = quakes, df_col = mag, subset_value = 6.0)
sub_df(df = quakes, df_col = mag, subset_value = 4.9)

#  Now look at a completely differnet data frame
head(mtcars)
unique(mtcars$cyl)
sub_df(df = mtcars, df_col = cyl, subset_value = 4)
