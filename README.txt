== Interpolare aplicata pe imagini ==
In practica, interpolarea aplicata pe imagini este folosita pentru:
* Transformari geometrice
* Texture filtering
* Image inpainting

Metode de interpolare:

Proximal_2x2:
	La inceput, am initializat, definit coordonatele pornind
de la faptul ca toate punctele se afla intre 1 si 2 si distanta
dintre 2 puncte consecutive este 0.1, adica STEP-ul. Cele 4 puncte
care le incadreaza pe celelalte sunt capetele adica (1,1), (1,2),
(2,1), (2,2) si le-am initializat astfel. La fel si matricea 
rezultat a fost initializata cu 0-uri. Parcurgand fiecare pixel
am verificat daca punctul meu este intr-un anumit cadran: spre
exemplu pe axa x-ului daca e mai mic ca jumatatea intervalului
adica mai mic ca (1+2)/2=1.5 atunci iau punctul din stanga ca
fiind cel mai apropiat; la fel am facut si pentru y, si respectiv
daca punctul e mai mare decat jumatatea axei il iau pe y2 ca cel
mai apropiat. Matricea de output este initializata, schimbata la
fiecare pas cu f de coordonatele mele si astfel se calculeaza
fiecare pixel din imaginea finala.
Proximal_2x2_RGB:
	Imaginea pe care am primit-o trebuie impartita in cele
3 canale si cautand am observat ca operatia img(:,:,1/2/3)
parcurge canalele si le imparte in red, green, respectiv blue.
Apoi, asa cum mi se spune am aplicat functia de proximal facuta
mai inainte pe cele 3 canale ale imaginii. Concatenarea am facut-o
cu cat si am dat-o matricei de output, out.
Proximal_resize:
	Dupa ce am observat cum se iau dimensiunile matricei I
si se verifica daca se converteste imaginea la alb-negru, am
initializat matricea finala ca o matrice nula. Apoi, am calculat
factorii de scalare tinand cont de indici. Am definit matricea
de transformare pentru redimensionare exact cum a precizat in 
tema. Am calculat inversa cu o functie scrisa de mine la prima
tema in care am pus comentarii. Parcurgand pixelii am aplicat 
transformarea inversei asupra [x,y] si am scos x_p si y_p ca
fiind elementele matricei dupa transformare. Am schimbat 
coordonatele adunand 1 la elemente, urmand sa calculez pixelii
luand imaginea finala cu coordoantele celui mai apropiat pixel
si pentru asta am aplicat functia de round. Convertirea am facut-o
cu uint8, asa cum mi s-a cerut in enunt.
Proximal_resize_RGB:
	Am gandit la fel ca la functia proximal_2x2_RGB, schimband
functia pe care o apelez exact dupa caz.
Proximal_rotate:
	Am calculat sin si cos cu functii deja predefinite, am
initializat matricea finala cu 0-uri, am format matricea de
transformare exact cum imi spune in enuntul temei si am aplicat
inversa. La fel ca la resize, am aplicat transformarea inversei
si am folosit o matrice auxiliara, matrice coloana in acest caz,
nu linie ca la resize. Am scos elementele si am adunat 1 pentru 
coordonate. Am pus conditiile in caz ca coordonatele mele sunt
mai mici sau mai mare ca limitele, adica decat 1 si m,n marimile
matricei, iar in acest caz am initializat rezultatul cu 0. Altfel,
am calculat punctele ce incojoara x_p si y_p cu functia de floor
si respectiv adunand 1. Am apelat functia de proximal_coef ce imi
calculeaza coeficientii conform formulei din tema, tocmai pentru 
a mi calcula coeficientii de interpolare notati cu a. Valoarea
interpolata a pixelui este calculata conform formulei.
Proximal_rotate_RGB:
	Asemanatoare cu celelalte 2 functii RGB.
Precalc_d:
	Dupa ce am initializat matricele functiei cu zero, am 
transformat matricea I in double. Parcurgand imaginea pentru 
fiecare matrice am apelat functiile unde am calculat derivatele
(in functie de x, de y si de x si y). In fiecare functie de 
derivate am verificat daca valoarea mea e la margine ca sa am
ca rezultat 0; formula respectiva am luat-o din enuntul temei.
Bicubic_coef:
	Am initializat pe rand, pas cu pas, prima matrice din
formula, a treia e transpusa primei, dar am vrut sa ii pun manual
fiecare element, pentru ca nu mai stiam exact in momentul acela
cum pun transpusa (bineinteles ca dupa am cautat si am vazut ca
merge cu ', dar o data ce mi a dat check am spus sa las asa), iar 
cea din mijloc ce continea fiecare element calculat anterior
in precalc_d, am scris-o la fel pe rand luand valorile citite
adica x1, y1, x2, y2. Le-am dat cast la fiecare si dupa le-am 
inmultit normal.
Bicubic_resize:
	Am initializat matricea finala cu 0. Am calculat factorii
de scalare asemanator cu cei din functia de resize din proximal.
Am luat matricea de transformare am format-o si i-am calculat si 
inversa. Am parcurs fiecare pixel din imagine. Am aplicat 
transformarea inversei asupra [x,y] si am scos x_p si y_p ca
fiind elementele matricei dupa transformare. Am schimbat 
coordonatele adunand 1 la elemente. Am gasit cele 4 puncte ce 
injoara punctul x, y cu functia predefinita floor. Daca rotunjirea
fiecarui x_p, respectiv y_p este mai mare sau egala decat marimile
matricei atunci imi schimba x, y cu limitele acelea. Am calculat
coeficientii de interpolare pur si simplu apeland functia 
bicubic_coef. Am scazut din coordonatele x_p, y_p, asa cum mi s-a
cerut x1, y1, ca sa trec in patratul unitate coordonatele.
Apoi, am initializat matricele din cerinta si le-am inmultit,
tinand cont ca trebuie sa trec coordonatele de la 1 la n, 
respectiv 1 la m. Plus transformarea de la final un uint8.
Bicubic_resize_RGB:
	Asemanator cu celelalte.
Final
