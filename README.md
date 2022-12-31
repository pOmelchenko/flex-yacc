Примеры и материал для "изучения" был найден в статье — http://rus-linux.net/lib.php?name=/MyLDP/algol/lex-yacc-howto.html


Как собрать:

```shell
yacc -d main.y
flex main.l
cc lex.yy.c y.tab.c -o main
```
