## Bevezetés

1. Valami ördög vagy ha nem hát kisnyúl.
2. Minden krétai hazudik -- mondja egy krétai.
3. Ki bántott? -- Senkise bántott.
4. Ha a szinusztétel gyros illatú, akkor legalább van, ami gyros illatú.
5. Ez a mondat hamis.
6. Ha a kocsmában van valaki, akkor a kocsmában van valaki, aki ha iszik, akkor mindenki iszik.

( 
7. Ha ördög, akkor pakol, vagy ha nem, akkor kisnyúl, tehát valaki pakol vagy kisnyúl.

8. Ha a kocsmában van valaki, akkor a kocsmában van valaki, aki ha bárki iszik, akkor ő iszik.
   
9. Ez a mondat igaz.

10. Bárki felszólal, valaki megsértődik.
 
11. Feltéve hogy, ha a titkár vagy az elnök jelen volt, akkor megvan a tettes, akkor ha a titkár jelen volt, akkor is megvan a tettes és ha az elnök jelen volt akkor is megvan a tettes. )

## Logikai következtetések

Ha $A_1,A_2,...,A_n,B$ mondatok,
akkor azt mondjuk, hogy az

$$\frac{A_1,A_2,...,A_n}{B}$$

szimbólummal jelölt következtetés *helyes*, ha minden olyan esetben,
amikor az *A*<sub>1</sub>, *A*<sub>2</sub>, ..., *A*<sub>n</sub>
mondatok (az úgy nevezett *premisszák* vagy *feltételek*) mindegyike
igaz, akkor a *B* mondat, azaz a *konkúzió* (*következmény*) is igaz.

A helyes következtetések listája elég nagy, ám vannak bizonyos
tekintetben alapvetőnek tekinthető kövekeztetések, melyeket könnyen
lehet kategorizálni a *bevezetési* és *kiküszöbölési szabályok* módszere
szerint.

## Direkt következtetések

A legegyszerűbb eset az *és* (jelben ∧) mondatoperátorral összekötött
összetett mondatokra vonatkozó bevezetési és kiküszöbölési szabály. Egy
mondatoperátor kiküszöbölési szabálya lényegében az, hogy megadja, mire
következtethetünk az adott operátorral összekötött mondatokból, jelen
esetben például *A és B* összetett mondatból. Eszerint:

$$(\wedge\\ \mathrm{ki})\quad\quad\frac{A\wedge B}{A},\quad\quad\frac{A\wedge B}{B}$$
Azaz, ha tudjuk, hogy *A és B* igaz, akkor jogos kijelentenünk, akár
*A*, akár *B* igazságának fennállását. A bevezetési szabály azt adja
meg, hogy miből következtethetünk az adott összetételre. Világos, hogy a
helyes következtetés fenti értelemezése szerint minden olyan esetben,
amikor az {*A*, *B*} premisszapár minden tagja igaz, levonhatjuk az *A
és B* konklúziót:

$$(\wedge\\ \mathrm{be})\quad\quad\frac{A,B}{A\wedge B}$$
A *vagy* (jelben: ∨) bevezetési szabálya szintén nyilvánvaló:

$$(\vee\\ \mathrm{be})\quad\quad\frac{A}{A\vee B},\quad\quad\frac{B}{A\vee B}$$
Ezzel szemben a kiküszöbölési szabályának tárgyalásával máris
belefutottunk a logikafilozófia ingoványába, ezt persze nem tárgyaljuk,
csak magát a következtetési szabályt. A *vagy* kiküszöbölési szabályát
az *esetszétválasztás szabályának* nevezzük:

$$(\vee\\ \mathrm{ki})\quad\quad\frac{\cfrac{\\A\\}{C},\\\cfrac{\\B\\}{C},\\A\vee B}{C}$$
*az esetszétválasztás szabálya* Azaz ha *A*-ból következik a *C* és a
*B*-ből is következik a *C*, továbbá az *A* és a *B* közül legalább az
egyik igaz (ez a klasszikus *vagy*: nem feltétlenül tudjuk, melyik igaz,
csak azt, hogy az egyik), akkor a *C* biztos igaz.

### Megjegyzés

Ezekkel analóg a ∀ és ∃, azaz "minden" és "létezik" szavakra vonatkozó
szabályok is. A ∀ az ∧-sel rokonítható, az ∃ a ∨-gyal. Ezek az
operátorok nem két mondatot kapcsolnak össze, hanem sok mondatra
vonatkoznak egyszerre, abban az értelemben, hogy egy *A(x)*
predikátumból (nyitott mondatból) készítenek egy új mondatot. Például az
*A(x)* := *x-nek van emelt szintű matematika érettségije* nyitott
mondatból a ∃ a (∃x)*A(x)* := *van akinek van emelt szintű matematika
érettségije* mondatot képezi, a ∀ a (∀x)*A(x)* := *mindenkinek van emelt
szintű matematika érettségije* mondatot képezi. Az előbbi azt jelenti,
hogy a "jelenlévők" közül (az "alaphalmazból") valakinek azaz Pistinek,
*vagy* Bélának, *vagy* Cilinek ill. valakinek van emelt érettségije
matekból -- persze **nem kell feltétlenül tudnunk**, hogy kinek; az
utóbbi pedig, hogy Pistinek is *és* Bélának is *és* Cilinek is *és*
Daniellának is *és* ... mindenkinek megvan az emelt matekja.

$$(\forall\\ \mathrm{ki})\quad\quad\frac{(\forall x)A(x)}{A(t)}$$
tetszőleges *t* dologra.

$$(\forall\\ \mathrm{be})\quad\quad\frac{A(x)}{(\forall x)A(x)}$$
ahol *x*-re semmilyen plusz megszorítás nincs.

$$(\exists\\ \mathrm{be})\quad\quad\frac{A(t)}{(\exists x)A(x)}$$
valamilyen *t* dologra.

$$(\exists\\ \mathrm{ki})\quad\quad\frac{\cfrac{\\A(x)\\}{C},(\exist x)A(x)}{C}$$

### Példa

A fenti következtetésekre azonnal hozhatunk példát a halmazok
témaköréből, ugyanis a halmazműveletek megfeleltethetők a logikai
műveleteknek. A halmazoknál van egy kitüntetett nyitott mondat: ha *H*
halmaz, akkor *x* ∈ *H* azt jelenti, hogy az alaphalmaz egy *x*-szel
jelölt (esetleg közelebbről jobban meg nem határozott) eleme benne van a
*H* halmazban. Legyenek *A* és *B* halmazok. Ekkor *A* és *B* uniója:

*A* ∪ *B*=<sub>def</sub>{*x* ∣ *x* ∈ *A* ∨ *x* ∈ *B*}
azaz azon elemek halmaza, mely az *A* illetve a *B* közül *legalább az
egyikben benne vannak*;

*A* és *B* metszete:

*A* ∩ *B*=<sub>def</sub>{*x* ∣ *x* ∈ *A* ∧ *x* ∈ *B*}
azaz azon elemek halmaza, mely az *A*-ban is *és* a *B*-ben is benne
vannak.

Ha választ várnánk arra a kérdésre, hogy *mi az a halmaz*, akkor szintén
a matematikafilozófia ingoványában találnánk magunkat, ezért
intellektuálisan a legtisztességesebb, ha tárgyunk célját (az analízis
elsajátítását) érdeklődésünk homlokterébe tartva, ezzel a kérdéssel nem
foglalkozunk.

Tudjuk: két halmaz egyenlő, akkor és csak akkor, ha ugyanazok az
elemeik. Formulákban:

*A* = *B*  ⇔  (∀*x*)( (*x* ∈ *A* ⇒ *x* ∈ *B*) ∧ (*x* ∈ *A* ⇐ *x* ∈ *B*) )
A nyilak a következtetés irányát jelzik. Az, hogy a "*ha A akkor B*"
(jelben: *A ⇒ B*) és az "*A -ból következik B*" (jelben: $\frac{A}{B}$)
ugyanazt jelenti, az egyáltalán nem nyilvánvaló és valójában az úgy
nevezett *dedukciótétel* mondja ki, persze bizonyos itt nem részletezett
feltételek mellett.

**1. Feladat.** Igazoljuk a disztributív szabályt, legalábbis az
egyiket, az alábbit:

*A* ∩ (*B* ∪ *C*) = (*A* ∩ *B*) ∪ (*A* ∩ *C*)
*Bizonyítás.* 1) Vegyünk egy tetszőleges *x*-et. Igazoljuk: "ha *x* ∈
baloldal, akkor *x* ∈ jobboldal".

*x* ∈ *A* ∩ (*B* ∪ *C*)

*x* ∈ *A*

*x* ∈ *B* ∪ *C*
Esetszétválasztás jön, mert innentől nem tudjuk, *x* a *B*-ben vagy a
''C'-ben van

*x* ∈ *B*

*x* ∈ *B*
és *x* ∈ *A* (igaz állítást bármihez "hozzáéselhetünk": és be)

*x* ∈ *A* ∩ *B*

*x* ∈ (*A* ∩ *B*)
vagy *x* ∈ (*A* ∩ *C*) (bármi "hozzávagyolható" egy igaz kijelentéshez:
vagy be)

*x* ∈ (*A* ∩ *B*) ∪ (*A* ∩ *C*)

*x* ∈ *C*

*x* ∈ *C*
és *x* ∈ *A* (igaz állítást bármihez "hozzáéselhetünk": és be)

*x* ∈ *A* ∩ *C*

*x* ∈ (*A* ∩ *C*)
vagy *x* ∈ (*A* ∩ *B*) (bármi "hozzávagyolható" egy igaz kijelentéshez:
vagy be)

*x* ∈ (*A* ∩ *B*) ∪ (*A* ∩ *C*)

*x* ∈ (*A* ∩ *B*) ∪ (*A* ∩ *C*)
azaz mindkét esetben kijött a jobboldal. 2) Visszafelé ugyanígy, csak
felfelé.

## Negáció, indirekt bizonyítás

A tagadás (negáció) kiküszöbölési szabálya az úgy nevezett *kettős
tagadás törlésének szabálya*:

$$(\neg\\ \mathrm{ki})\quad\quad\frac{\neg\neg A}{A}$$
A bevezetési szabálya pedig az úgy nevezett *redukció ad abszurdum*.

$$(\neg\\ \mathrm{be})\quad\quad\frac{\cfrac{\\A\\}{C},\\\cfrac{\\A\\}{\neg C}}{\neg A}$$
Ezeknek a segítségével olyan fontos tételeket is levezethetünk, mint a
De-Morgan azonosságok:

¬(*A* ∨ *B*) ≡ ¬*A* ∧ ¬*B*

¬(*A* ∧ *B*) ≡ ¬*A* ∨ ¬*B*
A fentiekben a ≡, hogy a két oldalon lévő kifejezés kölcsönösek
következik egymásból.

### Példák

Ami még hiányzik a logikai operációk és a halmazműveletek
megfeleltetéséből, az negáció halmazműveletekkel történő átfogalmazása,
mely nem titok, a komplementerképzés lesz. Sajnos komoly logikai
problémát okozna, ha komplementeren egy *A* halmaz esetén azon elemeket
értenénk, melyek nem az *A*-ban vannak. Ekkor ugyanis egy kisebb halmaz,
mint mondjuk az {1,2,3} komplementere a világ összes ezektől különböző
dolgából állna. Ezzel azonban világos, hogy megint a matematikafilozófia
ingoványos talajára tévednénk, így ezt másként tesszük.

Ha *H* halmaz, akkor az *A* halmaznak a *H*-ra vonatkozó komplementere
az

$$\overline{A}\|\_H=\_\mathrm{def}\\x\in H\mid x\notin A\\$$

Ha a fenti *H* halmazt alkalmasan nagynak választjuk, akkor elkerüljük a
logikai problémát.

Ezzel a De-Morgan-azonosságok halmazokkal megfogalmazott változata a
következő alakban írható:

$$\overline{A\cup B}=\overline{A}\cap\overline{B}$$

$$\overline{A\cap B}=\overline{A}\cup\overline{B}$$

A fenti egyenlőségek középiskolából ismert relációval is kifejezhetők.
Azt mondjuk, hogy *A* része *B*-nek, ha minden olyan esetben, amikor egy
elem eleme *A*-nak, akkor *B*-nek is eleme, jelben:

*A* ⊆ *B*
Azaz az, hogy *A* = *B* az ugyanaz, mint hogy *A* ⊆ *B* és *A* ⊇ *B* is
teljesül.

**2. Feladat.** Példaként nézzük csak a

$$\overline{A\cup B}\supseteq\overline{A}\cap\overline{B}$$
esetet.

*Megoldás.* Vegyünk egy elemet a jobboldalból és igazoljuk, hogy benne
van a baloldalban. Tudjuk a metszet definíciója miatt, hogy ekkor

*x* ∉ *A*

*x* ∉ *B*

*x* ∈ *A* ∨ *B*
(indirekt feltevés), ezek után esetszétválasztáshoz kell folyamodnunk.
Mindkét esetben ellentmondásra jutunk:

  
  
ha *x* ∈ *A*, akkor a legfelső

ha *x* ∈ *B*, akkor a legfelső alatti egyenlőség miatt jutunk
ellentmondásra, így a

*x* ∉ *A* ∨ *B* konklúzióra jutottunk.

Egy másik jellegzetes példa a részhalmaz relációval kapcsolatos. Előtte
azonban fel kell idéznünk a kvantrokra vonatkozó De-Morgan-azonosságot.
A "létezik" szót (mely a "minden" duálisa) ∃-tel jelöljük:

¬(∀*x*)*A*(*x*) ≡ (∃*x*)¬*A*(*x*)

¬(∃*x*)*A*(*x*) ≡ (∀*x*)¬*A*(*x*)
A kijelentések világosak: ha nem minden dolog *A*, akkor van olyan
dolog, ami nem *A*. Ha nem létezik *A*, akkor minden dolog nem *A*
tulajdonságú.

**3. Feladat.** Igazoljuk, hogy az üres halmaz minden halmaznak része.

*Megoldás.* Legyen *A* tetszőleges halmaz. Indirekten tegyük fel, hogy

∅ ⊈ *A*
Az ∅ ⊆ *A* formulákban így néz ki:

(∀*x*)(*x* ∈ ∅ ⇒ *x* ∈ *A*)
Egy ilyen tagadása az, hogy a kvantort átírjuk a duálisára és a
tulajdonságot tagadjuk:

(∃*x*)(*x* ∈ ∅ ∧ *x* ∉ *A*)
Ekkor azonban azt kaptuk, hogy létezik az üres halmaznak eleme, ami
ellentmondás.

## Boole-algebrai átalakítások

Világos, hogy az unióra és a metszetre a definíciójuk miatt ugyanazok az
azonosságok vonatkoznak, mint a "vagy"-ra és az "és"-re. Ezeket a
szabályokat Boole-algebrai azonosságoknak nevezzük. Ahhoz, hogy teljes
legyen a kép még egy fontos halmazműveletet fel kell elevenítenünk:
Legyenek *A* és *B* halmazok. Ekkor *A* mínusz *B* vagy *A* különbség
*B*:

*A* \\ *B*=<sub>def</sub>{*x* ∣ *x* ∈ *A* ∧ *x* ∉ *B*}
azaz azon elemek halmaza, melyek az *A*-nak elemei, de a *B*-nek nem.

Nagyon hasznos azonosság, hogy a különbség átírható komplementer és
metszet segítségével:

$$A\setminus B=A\cap\overline{B}$$
ahol a komplementerképzés egy olyan halmazra vonatkoztatjuk, melyben
minden szóban forgó halmaz részhalmazként benne van, például jelen
esetben *H* = *A* U *B* alkalmas ilyen halmaz .

**4. Feladat.** Igazoljuk, hogy tetszőleges *A*, *B* és *C* halmazokra

*A* \\ (*B* \\ *C*) = (*A* \\ *B*) ∪ (*A* ∩ *C*)

*Megoldás.* Írjuk fel a baloldalt és alakítsuk addig, míg ki nem jön a
jobboldal:

$$A\setminus(B\setminus C)=A\cap \overline{B \cap \overline{C}}=A\cap (\overline{B}\cup \overline{\overline{C}})=(A\cap \overline{B}) \cup (A\cap C)=$$

 = (*A* \\ *B*) ∪ (*A* ∩ *C*)

## Cáfoló példák, cáfoló szituációk

Azt, hogy egy kijelentés igaz, azt a matematikában *bizonyítással*
látjuk be. Például egy "ha *A*, akkor *B*" állítás esetén az *A*-ból
levezetjük *B*-t.

Azt, hogy egy kijelentés hamis, általában cáfoló ellenpélda vagy cáfoló
szituációra való rámutatással. Például egy "ha *A*, akkor *B*" állítás
cáfolása esetén meg kell mutatunk, hogy a megadott cáfoló szituációban
*A* ugyan igaz, de *B* nem. Ez azt jelenti, hogy ellenpélda esetén is
kell bizonyítanunk, éspedig az előző esetben azt, hogy "bár *A*, de nem
*B*". A metódus tehát a következő: 1) adunk egy példát 2) belátjuk, hogy
az adott példa ellenpélda.

### Példák

**5. Feladat.** Legyen *A*, *B* és *C* tetszőleges halmaz, továbbá
legyen

*K* = (*A* \\ (*B* \\ *C*)) \\ *C*
és

*L* = (*A* \\ *B*) ∪ (*A* ∩ *C*)
Vizsgáljuk meg, hogy melyik tartalmazás áll fenn!

1.  *K* ⊆ *L*
2.  *K* ⊇ *L*

*Megoldás.* Az *A* U *B*-re vonatkozó komplementerképzésre áttérve:

$$K=A\cap \overline{B\cap\overline{C}}\cap \overline{C}=A\cap (\overline{B}\cup C)\cap\overline{C}=((A\cap \overline{B})\cup (A\cap C))\cap\overline{C}=$$

$$=((A\setminus B)\cup (A\cap C))\cap\overline{C}=L\cap\overline{C}$$

Tehát *K* ⊆ *L* biztosan igaz, azaz (1) igaz.

Ellenben (2) hamis, *ellenpélda*:

*A* = *C* = {1} ≠ ∅
,*B* = ∅ *Ugyanis,* ekkor *K* = ∅, *L* ≠ ∅.

\<!--

**6. Feladat.** Legyen (*a*<sub>n</sub>) és (*b*<sub>n</sub>) két
tetszőleges sorozat. Melyik állítás következik a másikból és melyik nem?

1.  (*a*<sub>n</sub>) korlátos *vagy* (*b*<sub>n</sub>) korlátos
2.  (*a*<sub>n</sub>) korlátos *és* (*b*<sub>n</sub>) korlátos
3.  (*a*<sub>n</sub>⋅*b*<sub>n</sub>) korlátos

*Megoldás.*

1 -- \> 2 pusztán logikai okokból nem teljesül.

*Ellenpélda:* *a*<sub>n</sub>≡<!-- -->1 és (*b*<sub>n</sub>)=(n).

*Ugyanis,* bár 1 korlátos, így legalább az egyik korlátos, de mindkettő
nem.

2 -- \> 1 viszont logikai okokból igaz.

*Bizonyítás*: ha mindkettő korlátos, akkor világos, hogy legalább az
egyik korlátos.

1 -- \> 3 valószínűleg nem igaz. Valóban:

*ellenpélda* az 1-- \>2-beli.

*Ugyanis,* bár legalább az egyik korlátos, de a szorzat (1⋅n)=(n) nem
az.

2 -- \> 3 igaz.

*Bizonyítás.*
\|*a*<sub>n</sub>⋅*b*<sub>n</sub>\|=\|*a*<sub>n</sub>\|⋅\|*b*<sub>n</sub>\|
\< *K*⋅*L*, ahol *K* az egyik, *L*, a másik sorozat abszolútértékét
felül becslő szám.

3 -- \> 2 nem igaz

*Ellenpélda.* (n) és (1/n)

*Ugyanis.* bár a szorzat korlátos, az egyik sorozat nem az.

3 -- \> 1 becsapós.

*Ellenpélda.* *a*<sub>n</sub> = *n*, ha *n* páros és *a*<sub>n</sub>
=1/*n*, ha *n* páratlan. *b*<sub>n</sub> a "fordítottja", azaz párosakra
1/*n* és páratlanokra *n*.

*Ugyanis,* *a*<sub>n</sub>⋅*b*<sub>n</sub> = 1 és korlátos, de egyik sem
korlátos önmagában.--\>

## Házi feladatok

1.  K\\K\L) = L\\L\K)
2.  (K ∩ L) \\ ( K\M ) = K ∩ L ∩ M
3.  (K\L)\M = (K\M)\\L\M)

[Kategória:Matematika A1](Kategória:Matematika_A1 "wikilink")
