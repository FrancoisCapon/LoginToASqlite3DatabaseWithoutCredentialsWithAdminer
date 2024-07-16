# ./test $1 $2
# $1 version of PHP: 7.4.33, 8.2
# $2 version of adminer: 4.8.1, 4.8.4
cp chinook.sqlite.00 chinook.sqlite
(sleep 1 && firefox "http://localhost:8080/adminer-$2-sqlite-en.php?sqlite=&username=&db=chinook.sqlite&sql=select%20*%0Afrom%20Artist%0A" )&
docker run -it -v .:/var/www/html -p 127.0.0.1:8080:80 php:$1-cli-alpine php -S 0.0.0.0:80 -t /var/www/html

