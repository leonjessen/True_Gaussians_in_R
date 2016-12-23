rm(list=ls())

library('RCurl')
true_gaussians = function(size = 100, mean = 0.0, sd   = 1.0, dec  = 10){
  my_url       = paste0('https://www.random.org/gaussian-distributions/?num=',size,
                        '&mean=',mean,'&stdev=',sd,'&dec=',dec,
                        '&col=1&notation=scientific&format=html&rnd=new&format=plain')
  input_raw    = getURL(my_url)
  input_parsed = read.table(textConnection(input_raw))$V1
  return(input_parsed)
}
