from tuote import Tuote
from ostos import Ostos

class Ostoskori:
    def __init__(self):
        self._kori = []
        # ostoskori tallettaa Ostos-oliota, yhden per korissa oleva Tuote

    def tavaroita_korissa(self):
        maara = 0

        for i in self.ostokset():
            maara += i.lukumaara()

        return maara
        # kertoo korissa olevien tavaroiden lukumäärän
        # eli jos koriin lisätty 2 kpl tuotetta "maito", tulee metodin palauttaa 2 
        # samoin jos korissa on 1 kpl tuotetta "maito" ja 1 kpl tuotetta "juusto", tulee metodin palauttaa 2 

    def hinta(self):
        summa = 0

        for i in self.ostokset():
            summa += i.hinta()

        return summa
        # kertoo korissa olevien ostosten yhteenlasketun hinnan

    def lisaa_tuote(self, lisattava: Tuote):

        for i in range(len(self._kori)):
            if self._kori[i].tuotteen_nimi() == lisattava.nimi():
                self._kori[i].muuta_lukumaaraa(1)
                return
              
        self._kori.append(Ostos(lisattava))

    def poista_tuote(self, poistettava: Tuote):
        for i in range(len(self._kori)):
            if self._kori[i].tuotteen_nimi() == poistettava.nimi():
                self._kori[i].muuta_lukumaaraa(-1)
                return


    def tyhjenna(self):
        self._kori = []
        # tyhjentää ostoskorin

    def ostokset(self):
        return self._kori
        # palauttaa listan jossa on korissa olevat ostos-oliot
        # kukin ostos-olio siis kertoo mistä tuotteesta on kyse JA kuinka monta kappaletta kyseistä tuotetta korissa on
