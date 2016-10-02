library(rsconnect)
rsconnect::setAccountInfo(name='annettechiu',
                          token='66E808A750E5651D3E04BE00903D2124',
                          secret='3dWyinBUWm0UooMEa8j0pFDK2aQ9s1EAyD0TQIh9')
update.packages()
rsconnect::deployApp('/Users/annettechiu/Desktop/R-Shiny-project/movie')
runApp()








