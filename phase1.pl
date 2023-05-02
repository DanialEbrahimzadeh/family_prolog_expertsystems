/*
parent(x,y).
male(x).
female(y).

*/
male(ahmad).
male(reza).
male(amir).
male(saeed).
male(mohammad).
male(akbar).
male(omid).
male(ali).
male(masoud).
male(milad).
male(rahmat).
male(mohsen).
male(hasan).
male(hossein).
male(afshin).
male(danial).
male(gholam).

female(fatemeh).
female(zahra).
female(narges).
female(maryam).
female(sara).
female(hoda).
female(farzaneh).
female(marzieh).
female(yasamin).
female(fahimeh).
female(shima).
female(akram).
female(elham).
female(yalda).
female(mahsa).
female(setayesh).
female(razieh).
female(azam).
female(ashraf).

wife(ahmad,fatemeh).
wife(reza,zahra).
wife(narges,amir).
wife(saeed,hoda).
wife(maryam,mohammad).
wife(sara,omid).
wife(farzaneh,akbar).
wife(rahmat,fahimeh).
wife(masoud,shima).
wife(milad,yasamin).
wife(ali,marzieh).
wife(ashraf,hossein).
wife(ashraf,afshin).
wife(setayesh,hasan).
wife(yalda,hasan).
wife(mohsen,akram).

parent(ahmad,farzaneh).
parent(ahmad,hoda).
parent(ahmad,omid).
parent(fatemeh,farzaneh).
parent(fatemeh,hoda).
parent(fatemeh,omid).
parent(reza,akbar).
parent(reza,sara).
parent(reza,mohammad).
parent(zahra,akbar).
parent(zahra,sara).
parent(zahra,mohammad).
parent(amir,maryam).
parent(amir,saeed).
parent(narges,maryam).
parent(narges,saeed).
parent(farzaneh,hossein).
parent(hoda,shima).
parent(hoda,rahmat).
parent(omid,ali).
parent(omid,yasamin).
parent(omid,masoud).
parent(akbar,hossein).
parent(sara,ali).
parent(sara,yasamin).
parent(sara,masoud).
parent(mohammad,milad).
parent(mohammad,fahimeh).
parent(maryam,milad).
parent(maryam,fahimeh).
parent(saeed,rahmat).
parent(saeed,shima).
parent(shima,akram).
parent(rahmat,mohsen).
parent(rahmat,yalda).
parent(fahimeh,mohsen).
parent(fahimeh,yalda).
parent(milad,hasan).
parent(masoud,akram).
parent(yasamin,hasan).
parent(hossein,setayesh).
parent(hossein,azam).
parent(setayesh,mahsa).
parent(hasan,mahsa).
parent(hasan,gholam).
parent(yalda,gholam).
parent(mohsen,danial).
parent(mohsen,elham).
parent(akram,danial).
parent(akram,elham).
parent(afshin,razieh).
parent(ashraf,setayesh).
parent(ashraf,azam).
parent(ashraf,razieh).


different(X,Y):- X\=Y.


pedar(X,Y):-parent(X,Y) , male(X).
madar(X,Y):-parent(X,Y) , female(X).
pesar(X,Y):-parent(Y,X) , male(X).
dokhtar(X,Y):-parent(Y,X) , female(X).
%wife(X,Y):-parent(X,Z) , parent(Y,Z).
shohar(X,Y):-(wife(X,Y) ;wife(Y,X)) , male(X) , female(Y).
zan(X,Y):-(wife(X,Y) ;wife(Y,X)) , female(X) , male(Y).
khahar(X,Y):-pedar(Z,X) , pedar(Z,Y) , female(X) , different(X,Y).
baradar(X,Y):-pedar(Z,X) , pedar(Z,Y) , male(X) , different(X,Y).
pedarbozorg(X,Y):-pedar(X,Z) , parent(Z,Y).
madarbozorg(X,Y):-madar(X,Z) , parent(Z,Y).
amme(X,Y):-khahar(X,Z) , pedar(Z,Y).
amu(X,Y):-baradar(X,Z) , pedar(Z,Y).
khale(X,Y):-khahar(X,Z) , madar(Z,Y).
daee(X,Y):-baradar(X,Z) , madar(Z,Y).
naveh(X,Y):-pedarbozorg(Y,X) ; madarbozorg(Y,X).
khaharzadeh(X,Y):-madar(Z,X) , khahar(Z,Y).
dokhtarekhahar(X,Y):-khaharzadeh(X,Y) , female(X).
pesarekhahar(X,Y):-khaharzadeh(X,Y) , male(X).
baradarzadeh(X,Y):-pedar(Z,X) , baradar(Z,Y).
dokhtarebaradar(X,Y):-baradarzadeh(X,Y) , female(X).
pesarebaradar(X,Y):-baradarzadeh(X,Y) , male(X).
shoharekhahar(X,Y):-shohar(X,Z) , khahar(Z,Y).
zanebaradar(X,Y):-zan(X,Z) , baradar(Z,Y).
madarzan(X,Y):-madar(X,Z) , zan(Z,Y).
pedarzan(X,Y):-pedar(X,Z) , zan(Z,Y).
madarshohar(X,Y):-madar(X,Z) , shohar(Z,Y).
pedarshohar(X,Y):-pedar(X,Z) , shohar(Z,Y).
napedary(X,Y):-shohar(X,Z) , madar(Z,Y) , not(pedar(X,Y)).
namadary(X,Y):-zan(X,Z) , pedar(Z,Y) , not(madar(X,Y)).
shoharekhale(X,Y):-shohar(X,Z) , khale(Z,Y).
shohareamme(X,Y):-shohar(X,Z) , amme(Z,Y).
zanedaee(X,Y):-zan(X,Z) , daee(Z,Y).
zaneamu(X,Y):-zan(X,Z) , amu(Z,Y).
dokhtaredaee(X,Y):-dokhtar(X,Z) , daee(Z,Y).
pesaredaee(X,Y):-pesar(X,Z) , daee(Z,Y).
dokhtareamu(X,Y):-dokhtar(X,Z) , amu(Z,Y).
pesareamu(X,Y):-pesar(X,Z) , amu(Z,Y).
dokhtarekhale(X,Y):-dokhtar(X,Z) , khale(Z,Y).
pesarekhale(X,Y):-pesar(X,Z) , khale(Z,Y).
dokhtareamme(X,Y):-dokhtar(X,Z) , amme(Z,Y).
pesareamme(X,Y):-pesar(X,Z) , amme(Z,Y).
bajenagh(X,Y):-shohar(X,Z) , shohar(Y,W) , khahar(Z,W).
jari(X,Y):-zan(X,Z) , zan(Y,W) , baradar(Z,W) , baradar(W,Z).
khaharezan(X,Y):-khahar(X,Z) , zan(Z,Y).
baradarezan(X,Y):-baradar(X,Z) , zan(Z,Y).
khahareshohar(X,Y):-khahar(X,Z) , shohar(Z,Y).
baradareshohar(X,Y):-baradar(X,Z) , shohar(Z,Y).
arus(X,Y):-zan(X,Z) , pesar(Z,Y).
damad(X,Y):-shohar(X,Z) , dokhtar(Z,Y).


naveamu(X,Y):-naveh(X,Z) , amu(Z,Y).
naveamme(X,Y):-naveh(X,Z) , amme(Z,Y).
navedaee(X,Y):-naveh(X,Z) , daee(Z,Y).
navekhale(X,Y):-naveh(X,Z) , khale(Z,Y).
aruseamu(X,Y):-arus(X,Z) , amu(Z,Y).
damadeamu(X,Y):-damad(X,Z) , amu(Z,Y).
aruseamme(X,Y):-arus(X,Z) , amme(Z,Y).
damadeamme(X,Y):-damad(X,Z) , amme(Z,Y).
arusedaee(X,Y):-arus(X,Z) , daee(Z,Y).
damadedaee(X,Y):-damad(X,Z) , daee(Z,Y).
arusekhale(X,Y):-arus(X,Z) , khale(Z,Y).
damadekhale(X,Y):-damad(X,Z) , khale(Z,Y).

navebaradar(X,Y):-naveh(X,Z) , baradar(Z,Y).
navekhahar(X,Y):-naveh(X,Z) , khahar(Z,Y).
arusekhahar(X,Y):-arus(X,Z) , khahar(Z,Y).
damadekhahar(X,Y):-damad(X,Z) , khahar(Z,Y).
arusebaradar(X,Y):-arus(X,Z) , baradar(Z,Y).
damadebaradar(X,Y):-damad(X,Z) , baradar(Z,Y).

jad(X,Y):-pedar(X,Y).
jad(X,Y):-pedar(X,Z) , jad(Z,Y).

search(X,Y,Z):-jad(Z,X) , jad(Z,Y).

/*/////////////////////////////////////////////// / */


relation(X,Y,pedar):-pedar(X,Y).
relation(X,Y,madar):-madar(X,Y).
relation(X,Y,pesar):-pesar(X,Y).
relation(X,Y,dokhtar):-dokhtar(X,Y).
relation(X,Y,shohar):-shohar(X,Y).
relation(X,Y,zan):-zan(X,Y).
relation(X,Y,khahar):-khahar(X,Y).
relation(X,Y,baradar):-baradar(X,Y).
relation(X,Y,pedarbozorg):-pedarbozorg(X,Y).
relation(X,Y,madarbozorg):-madarbozorg(X,Y).
relation(X,Y,amme):-amme(X,Y).
relation(X,Y,amu):-amu(X,Y).
relation(X,Y,khale):-khale(X,Y).
relation(X,Y,daee):-daee(X,Y).
relation(X,Y,naveh):-naveh(X,Y).
relation(X,Y,khaharzadeh):-khaharzadeh(X,Y).
relation(X,Y,dokhtarekhahar):-dokhtarekhahar(X,Y).
relation(X,Y,pesarekhahar):-pesarekhahar(X,Y).
relation(X,Y,baradarzadeh):-baradarzadeh(X,Y).
relation(X,Y,dokhtarebaradar):-dokhtarebaradar(X,Y).
relation(X,Y,pesarebaradar):-pesarebaradar(X,Y).
relation(X,Y,shoharekhahar):-shoharekhahar(X,Y).
relation(X,Y,zanabaradar):-zanebaradar(X,Y).
relation(X,Y,madarzan):-madarzan(X,Y).
relation(X,Y,pedarzan):-pedarzan(X,Y).
relation(X,Y,madarshohar):-madarshohar(X,Y).
relation(X,Y,pedarshohar):-pedarshohar(X,Y).
relation(X,Y,napedary):-napedary(X,Y).
relation(X,Y,namadary):-namadary(X,Y).
relation(X,Y,shoharekhale):-shoharekhale(X,Y).
relation(X,Y,shohareamme):-shohareamme(X,Y).
relation(X,Y,zanamu):-zaneamu(X,Y).
relation(X,Y,zanedaee):-zanedaee(X,Y).
relation(X,Y,dokhtareamu):-dokhtareamu(X,Y).
relation(X,Y,pesareamu):-pesareamu(X,Y).
relation(X,Y,dokhtareamme):-dokhtareamme(X,Y).
relation(X,Y,pesareamme):-pesareamme(X,Y).
relation(X,Y,dokhtaredaee):-dokhtaredaee(X,Y).
relation(X,Y,pesaredaee):-pesaredaee(X,Y).
relation(X,Y,dokhtarekhale):-dokhtarekhale(X,Y).
relation(X,Y,pesarekhale):-pesarekhale(X,Y).
relation(X,Y,bajenagh):-bajenagh(X,Y).
relation(X,Y,jari):-jari(X,Y).
relation(X,Y,khaharezan):-khaharezan(X,Y).
relation(X,Y,khahareshohar):-khahareshohar(X,Y).
relation(X,Y,baradarezan):-baradarezan(X,Y).
relation(X,Y,baradareshohar):-baradareshohar(X,Y).
relation(X,Y,arus):-arus(X,Y).
relation(X,Y,damad):-damad(X,Y).
relation(X,Y,naveamu):-naveamu(X,Y).
relation(X,Y,naveamme):-naveamme(X,Y).
relation(X,Y,navedaee):-navedaee(X,Y).
relation(X,Y,navekhale):-navekhale(X,Y).
relation(X,Y,aruseamu):-aruseamu(X,Y).
relation(X,Y,damadeamu):-damadeamu(X,Y).
relation(X,Y,aruseamme):-aruseamme(X,Y).
relation(X,Y,damadeamme):-damadeamme(X,Y).
relation(X,Y,arusedaee):-arusedaee(X,Y).
relation(X,Y,damadedaee):-damadedaee(X,Y).
relation(X,Y,arusekhale):-arusekhale(X,Y).
relation(X,Y,damadekhale):-damadekhale(X,Y).
relation(X,Y,navekhahar):-navekhahar(X,Y).
relation(X,Y,navebaradar):-navebaradar(X,Y).
relation(X,Y,arusekhahar):-arusekhahar(X,Y).
relation(X,Y,damadekhahar):-damadekhahar(X,Y).
relation(X,Y,arusebaradar):-arusebaradar(X,Y).
relation(X,Y,damadebaradar):-damadebaradar(X,Y).
relation(X,Y,jad):-jad(X,Y).





































