# This R-script will generate true gaussian numbers using random.org
# Athored by Leon Eyrich Jessen, December 2016
# https://github.com/leonjessen/True_Gaussians_in_R

# Clear workspace
# ------------------------------------------------------------------------------
rm(list=ls())

# Load libraries
# ------------------------------------------------------------------------------
library('RCurl')

# Define function for retrieving true gaussians
# ------------------------------------------------------------------------------
true_gaussians = function( size = 100, mean = 0.0, sd = 1.0, dec = 10 ){
  my_url       = paste0('https://www.random.org/gaussian-distributions/?num=',
                        size,'&mean=',mean,'&stdev=',sd,'&dec=',dec,'&col=1',
                        '&notation=scientific&format=html&rnd=new&format=plain')
  input_raw    = getURL(my_url)
  input_parsed = read.table(textConnection(input_raw))$V1
  return(input_parsed)
}

# Test the function
# ------------------------------------------------------------------------------
test = true_gaussians()
plot( density( test, adjust = 0.5 ), main = 'True Gaussian Numbers from random.org')
legend("topright",c(paste0('mu = ', round(mean(test),3)),
                    paste0('sigma = ', round(sd(test),3)),
                    paste0('n = ', length(test))),bty="n")
