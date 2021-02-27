# Monitorizare-temperatur-

Pentru impleentarea acestei teme a fost nevoie de implementarea a 4 module:

SENSORS_INPUT

Acest modul primeste ca variabile de intrare  un semnal de maxim 200 de 
biti(valoarea parametrului), sensors_en_i care ne da informatie despre senzorii activi. 

Daca bitul curent este 1 atunci o sa crestem numarul senzorilor 
activi si de asemenea vom aduna la suma totala bitii corespunzatori temperaturii. 
Avand in vedere ca fiecarui bit din sensors_en_i corespunde a 8 biti din sensors_data_i, 
pentru a datermina bitii corespunzatori, vom observa ca bitul de inceput este 
pe pozitia 8*(i+1)-1. Inseamna ca bitul de final o sa fie pe pozitia 8*(i+1) - 8. Dar in modul 
o sa fim nevoiti sa aplicam operatorul -: care ne arata de cate ori o sa fie decrementata
pozitia initiala pentru a ajunge la cea finala. 

DIVISION

Acest modul ne da restul si catul impartirii a doua numere. Inputul este format din 2 semnale
N si D , numere pe care dorim sa le impartim. Iesrile Q si R reprezinta catul si 
restul acelei impartiri. Acest modul l-am implementat cu ajutorul resurselor puse la dispozitie 
in pdf.ul temei.

OUTPUT_DISPLAY

In acest modul suntem nevoiti sa aproximam temperatura medie pe care o obtinem dupa care
sa o codificam conform tabelului din pdf. Pentru a reusi sa aproximam temperatura medie 
am gandit ca restul pe care il obtinem din iesirea modulului division sa il aproximam 
sub forma de procent fata de impartitor(numarul de senzori activi). Daca procentul este 
mai mare ca 50% din media temperaturii se va aproxima la urmatorul intreg ( acest lucru l-am 
verificat inmultind restul cu 2 si comparandu-l cu impartitorul). Daca nu,
aceeasta se poate aproxima cu catul dat de modulul division.
Pentru a codifica temperatura medie am comparat-o cu fiecare dintre numerele date in tabel.

TEMPERATURE_TOP

In acest modul a trebuit sa apelam fiecare dintre modulele de mai sus.
Si in aceasta modul am definit un parametru = 200 deoarece intrarile in blocul temperature_top
corespund si intrarilor blocului sensors_input.
De asemenea am folosit variabile de tip wire pt a memora rezultatele obtinute in urma apelarilor 
celorlalte modue.
 
