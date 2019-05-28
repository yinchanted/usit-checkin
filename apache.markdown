Action markdown /cgi-bin/markdown.cgi
AddHandler markdown .md
DirectoryIndex index.md

Alias /lib /usr/local/lib
<Directory /usr/local/lib>
  Options Indexes FollowSymLinks
  IndexOptions +XHTML

  AllowOverride None
  Require all granted
</Directory>

