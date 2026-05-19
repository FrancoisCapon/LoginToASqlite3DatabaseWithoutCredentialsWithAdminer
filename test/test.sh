# ./test $1 $2
# $1 version of PHP: 7.4.33, 8.2
# $2 version of adminer: 4.8.1, 4.8.4
cp chinook.sqlite.00 chinook.sqlite
(sleep 1 && firefox "http://localhost:8080/adminer-5.4.2-sqlite-en.php?sqlite=&username=&db=chinook.sqlite&schema=Playlist%3A1x-2_Invoice%3A1x20_Customer%3A16x21_InvoiceLine%3A6x8_Track%3A19x10_Genre%3A37x10_MediaType%3A43x6_Employee%3A37x22_Album%3A25x-1_Artist%3A32x-1_PlaylistTrack%3A8x-2" )&
(sleep 2 && firefox "http://localhost:8080/adminer-$2-sqlite-en.php?sqlite=&username=&db=chinook.sqlite&sql=select%20*%0Afrom%20Artist%0A")&
docker run -it -v .:/var/www/html -p 127.0.0.1:8080:80 php:$1-cli-alpine php -S 0.0.0.0:80 -t /var/www/html

