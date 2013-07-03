#!/bin/bash

# system_page - A script to produce a system information HTML file

##### Constants

TITLE="$HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by " 

##### Functions

function system_info
{
   echo "<h2>Release Info</h2>"
   echo "<p>Function not yet implemented</p>"
}   


function show_uptime
{
    echo "<h2>Uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"
}   


function drive_space
{
    echo "<h2>Filesystem Space</h2>"
    echo "<pre>"
    df
    echo "</pre>"
}   


function home_space
{
    # Only the superuser can get this information
    if [ "$(id -u)" = "0" ]; then
        echo "<h2>Home Directory Space by User</h2>"
        echo "<pre>"
        echo "Bytes Directory"
        du -s /home/* | sort -nr
        echo "</pre>"
    fi
}   


##### Main

cat <<- _EOF_
  <html>
  <head>
      <title>$TITLE</title>
  </head>
  <body style=font-family:Helvetica;background-color:black;color:white>
      <h1 style=text-align:center;width:100%>$TITLE</h1>
      <p style=text-align:center;width:100%>$TIME_STAMP<b style=color:yellow>$USER</b></p>
      $(system_info)
      $(show_uptime)
      $(drive_space)
      $(home_space)
  </body>
  </html>
_EOF_
