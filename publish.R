library(rsconnect)

#Create account on shinyapps.io

rsconnect::setAccountInfo(name='XXX',     # Find this command on shinyapps.io:
                          token='XXX',    # https://www.shinyapps.io/admin/#/tokens
                          secret='XXX') 

# Make sure you're in the folder with ui.R and server.R and that the folder name
# has at least 4 characters only contains letters, numbers, dashes and hyphens.
deployApp()

#Enjoy!