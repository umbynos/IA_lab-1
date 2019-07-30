(defmodule DATA (import TEMPLATES ?ALL) (export ?ALL))

(deffacts DATA::localities 
    (locality
        (name "Torino")
        (_region "Piemonte")
        (culturale 4)
        (sportivo 4)
        (termale 1)
        (enogastronomico 3)
        (naturalistico 2)
    )
    (locality
        (name "Cherasco")
        (_region "Piemonte")
        (naturalistico 3)
        (culturale 5)
        (religioso 2)
        (sportivo 3)
        (enogastronomico 5)
    )
    (locality
        (name "Asti")
        (_region "Piemonte")
        (naturalistico 1)
        (culturale 4)
        (sportivo 1)
        (religioso 1)
        (enogastronomico 5)
    )
    (locality
        (name "Pré-Saint-Didier")
        (_region "Valle d'Aosta")
        (montano 5)
        (lacustre 3)
        (naturalistico 5)
        (termale 5)
        (culturale 2)
        (religioso 2)
        (sportivo 3)
        (enogastronomico 3)
    )
    (locality
        (name "Aosta")
        (_region "Valle d'Aosta")
        (montano 3)
        (lacustre 2)
        (naturalistico 2)
        (culturale 5)
        (sportivo 2)
        (enogastronomico 3)
    )
    (locality
        (name "Genova")
        (_region "Liguria")
        (balneare 3)
        (montano 2)
        (culturale 4)
        (religioso 1)
        (sportivo 2)
        (enogastronomico 3)
    )
    (locality
        (name "Imperia")
        (_region "Liguria")
        (balneare 5)
        (montano 2)
        (naturalistico 3)
        (culturale 3)
        (religioso 2)
        (sportivo 4)
        (enogastronomico 3)
    )
    (locality
        (name "Milano")
        (_region "Lombardia")
        (culturale 5)
        (sportivo 3)
        (enogastronomico 3)
    )
    (locality
        (name "Como")
        (_region "Lombardia")
        (montano 2)
        (lacustre 5)
        (termale 4)
        (naturalistico 4)
        (culturale 3)
        (religioso 1)
        (sportivo 2)
        (enogastronomico 1)
    )
    (locality
        (name "Bologna")
        (_region "Emilia Romagna")
        (culturale 5)
        (religioso 2)
        (sportivo 3)
        (enogastronomico 5)
    )
    (locality
        (name "Rimini")
        (_region "Emilia Romagna")
        (culturale 2)
        (balneare 4)
        (naturalistico 2)
        (enogastronomico 3)
    )
    (locality
        (name "Venezia")
        (_region "Veneto")
        (culturale 5)
        (religioso 3)
        (sportivo 3)
        (enogastronomico 3)
        (lacustre 5)
        (naturalistico 2)
    )
    (locality
        (name "Verona")
        (_region "Veneto")
        (culturale 4)
        (religioso 1)
        (termale 1)
        (sportivo 2)
        (enogastronomico 3)
        (naturalistico 2)
    )
    (locality
        (name "Trento")
        (_region "Trentino Alto Adige")
        (culturale 4)
        (montano 4)
        (lacustre 3)
        (termale 3)
        (enogastronomico 3)
        (naturalistico 3)
    )
    (locality
        (name "Bolzano")
        (_region "Trentino Alto Adige")
        (culturale 4)
        (montano 4)
        (lacustre 1)
        (enogastronomico 4)
        (naturalistico 3)
    )
    (locality
        (name "Trieste")
        (_region "Friuli Venezia Giulia")
        (culturale 4)
        (balneare 3)
        (montano 3)
        (enogastronomico 3)
        (naturalistico 3)
    )
    (locality
        (name "Gorizia")
        (_region "Friuli Venezia Giulia")
        (culturale 4)
        (montano 3)
        (enogastronomico 3)
        (naturalistico 4)
    )
    (locality
        (name "Firenze")
        (_region "Toscana")
        (culturale 5)
        (termale 1)
        (naturalistico 2)
        (religioso 3)
        (sportivo 2)
        (enogastronomico 4)
    )
    (locality
        (name "Saturnia")
        (_region "Toscana")
        (naturalistico 5)
        (termale 5)
        (culturale 2)
    )
    (locality
        (name "Perugia")
        (_region "Umbria")
        (naturalistico 3)
        (religioso 2)
        (enogastronomico 5)
        (montano 1)
        (sportivo 1)
        (culturale 4)
    )
    (locality
        (name "Assisi")
        (_region "Umbria")
        (montano 3)
        (naturalistico 4)
        (enogastronomico 4)
        (sportivo 1)
        (religioso 5)
        (culturale 3)
    )
    (locality
        (name "Ancona")
        (_region "Marche")
        (balneare 5)
        (naturalistico 1)
        (culturale 2)
        (enogastronomico 3)
    )
    (locality
        (name "Urbino")
        (_region "Marche")
        (enogastronomico 3)
        (culturale 5)
        (religioso 2)
        (sportivo 2)
    )
    (locality
        (name "Roma")
        (_region "Lazio")
        (culturale 5)
        (religioso 5)
        (enogastronomico 5)
        (lacustre 3)
        (sportivo 2)
        (naturalistico 1)
        (termale 2)


    )
    (locality
        (name "Rieti")
        (_region "Lazio")
        (lacustre 3)
        (naturalistico 4)
        (termale 5)
        (montano 2)
        (sportivo 3)
        (religioso 2)
    )
    (locality
        (name "L'Aquila")
        (_region "Abruzzo")
        (montano 2)
        (culturale 3)
        (sportivo 2)
        (religioso 2)
        (naturalistico 3)

    )
    (locality
        (name "Pescara")
        (_region "Abruzzo")
        (balneare 4)
        (naturalistico 4)
        (religioso 2)
        (enogastronomico 2)
    )
    (locality
        (name "Termoli")
        (_region "Molise")
        (balneare 5)
        (naturalistico 4)
        (culturale 3)
        (enogastronomico 4)
        (sportivo 1)

    )
    (locality
        (name "Campobasso")
        (_region "Molise")
        (culturale 4)
        (naturalistico 3)
        (religioso 4)
        (sportivo 2)
        (enogastronomico 2)
    )
    (locality
        (name "Napoli")
        (_region "Campagna")
        (culturale 5)
        (balneare 5)
        (naturalistico 5)
        (enogastronomico 5)
        (sportivo 3)
        (religioso 4)
        (montano 2)

    )
    (locality
        (name "Benevento")
        (_region "Campagna")
        (culturale 5)
        (naturalistico 3)
        (religioso 3)
        (enogastronomico 4)
    )
    (locality
        (name "Brindisi")
        (_region "Puglia")
        (balneare 5)
        (naturalistico 3)
        (culturale 4)
        (religioso 2)
        (enogastronomico 4)
    )
    (locality
        (name "Trani")
        (_region "Puglia")
        (balneare 5)
        (culturale 3)
        (religioso 4)
        (naturalistico 4)
        (enogastronomico 4)
    )
    (locality
        (name "Matera")
        (_region "Basilicata")
        (montano 5)
        (balneare 4)
        (naturalistico 5)
        (culturale 5)
        (religioso 3)
        (enogastronomico 3)
    )
    (locality
        (name "Potenza")
        (_region "Basilicata")
        (montano 2)
        (balneare 4)
        (culturale 4)
        (religioso 3)
        (enogastronomico 3)
        (naturalistico 2)
    )
    (locality
        (name "Crotone")
        (_region "Calabria")
        (balneare 5)
        (montano 1)
        (lacustre 2)
        (naturalistico 5)
        (culturale 1)
        (enogastronomico 3)
    )
    (locality
        (name "Pizzo")
        (_region "Calabria")
        (balneare 5)
        (montano 4)
        (lacustre 3)
        (naturalistico 4)
        (religioso 4)
        (enogastronomico 5)
        (culturale 4)
        (sportivo 3)
    )
    (locality
        (name "Lipari")
        (_region "Sicilia")
        (balneare 5)
        (naturalistico 5)
        (culturale 4)
        (enogastronomico 2)
        (religioso 3)
    )
    (locality
        (name "Vulcano")
        (_region "Sicilia")
        (balneare 5)
        (naturalistico 5)
        (culturale 4)
        (enogastronomico 2)
        (religioso 3)
        (montano 2)
        (termale 5)
    )
    (locality
        (name "Cagliari")
        (_region "Sardegna")
        (balneare 5)
        (naturalistico 5)
        (culturale 3)
        (enogastronomico 5)
        (religioso 3)
        (sportivo 4)
    )
    (locality
        (name "Caprera")
        (_region "Sardegna")
        (balneare 5)
        (montano 1)
        (naturalistico 5)
        (culturale 5)
        (enogastronomico 4)
        (religioso 3)
        (sportivo 4)
    )
)

(deffacts DATA::hotels
    (hotel 
        (name "Palace Hotel")
        (stars 3)
        (location "Torino")
        (free_rooms 60)
    )
    (hotel
        (name "Royal Superga")
        (stars 5)
        (location "Torino")
        (free_rooms 10)
    )
    (hotel 
        (name "Nova Hotel")
        (stars 4)
        (location "Asti")
        (free_rooms 54)
    )
    (hotel
        (name "Astioria")
        (stars 2)
        (location "Asti")
        (free_rooms 10)
    )
    (hotel 
        (name "Napoleon")
        (stars 4)
        (location "Cherasco")
        (free_rooms 20)
    )
    (hotel
        (name "Imperial")
        (stars 5)
        (location "Cherasco")
        (free_rooms 7)
    )
    (hotel 
        (name "Mogol")
        (stars 3)
        (location "Pré-Saint-Didier")
        (free_rooms 10)
    )
    (hotel
        (name "Resorting SPA")
        (stars 5)
        (location "Pré-Saint-Didier")
        (free_rooms 47)
    )
    (hotel 
        (name "Galimberti")
        (stars 3)
        (location "Aosta")
        (free_rooms 10)
    )
    (hotel
        (name "Il fortino")
        (stars 2)
        (location "Aosta")
        (free_rooms 43)
    )
    (hotel 
        (name "Green Hotel")
        (stars 1)
        (location "Genova")
        (free_rooms 94)
    )
    (hotel
        (name "Astor")
        (stars 3)
        (location "Genova")
        (free_rooms 7)
    )
    (hotel 
        (name "Hotel Camiglia")
        (stars 2)
        (location "Imperia")
        (free_rooms 23)
    )
    (hotel
        (name "Sinavilla Matilde")
        (stars 4)
        (location "Imperia")
        (free_rooms 75)
    )
    (hotel 
        (name "Dok Milano")
        (stars 2)
        (location "Milano")
        (free_rooms 98)
    )
    (hotel
        (name "Le pertite Hotel")
        (stars 3)
        (location "Milano")
        (free_rooms 65)
    )
    (hotel 
        (name "Miramonti")
        (stars 4)
        (location "Como")
        (free_rooms 10)
    )
    (hotel
        (name "Residence del sole")
        (stars 3)
        (location "Como")
        (free_rooms 97)
    )
    (hotel 
        (name "Hotel due mondi")
        (stars 2)
        (location "Bologna")
        (free_rooms 59)
    )
    (hotel
        (name "Grand Hotel Bristol")
        (stars 3)
        (location "Bologna")
        (free_rooms 49)
    )
    (hotel 
        (name "Hotel Diamante")
        (stars 5)
        (location "Rimini")
        (free_rooms 9)
    )
    (hotel
        (name "Villa delle rose")
        (stars 1)
        (location "Rimini")
        (free_rooms 32)
    )
    (hotel 
        (name "Palazzo di Amindta")
        (stars 5)
        (location "Venezia")
        (free_rooms 43)
    )
    (hotel
        (name "Locanda della posta")
        (stars 1)
        (location "Venezia")
        (free_rooms 65)
    )
    (hotel 
        (name "Hotel Iris")
        (stars 4)
        (location "Verona")
        (free_rooms 10)
    )
    (hotel
        (name "Ca' dei principi")
        (stars 2)
        (location "Verona")
        (free_rooms 9)
    )
    (hotel 
        (name "Hotel Rosalba")
        (stars 1)
        (location "Trento")
        (free_rooms 54)
    )
    (hotel
        (name "Hotel cenacolo")
        (stars 4)
        (location "Trento")
        (free_rooms 32)
    )
    (hotel 
        (name "Le Grazie Hotel")
        (stars 1)
        (location "Bolzano")
        (free_rooms 59)
    )
    (hotel
        (name "Hotel Monazzi")
        (stars 3)
        (location "Bolzano")
        (free_rooms 98)
    )
    (hotel 
        (name "Europa")
        (stars 2)
        (location "Trieste")
        (free_rooms 95)
    )
    (hotel
        (name "Deco Hotel")
        (stars 1)
        (location "Trieste")
        (free_rooms 54)
    )
    (hotel 
        (name "Garden")
        (stars 2)
        (location "Gorizia")
        (free_rooms 76)
    )
    (hotel
        (name "MOM")
        (stars 4)
        (location "Gorizia")
        (free_rooms 25)
    )
    (hotel 
        (name "Taverna Dantesca")
        (stars 1)
        (location "Firenze")
        (free_rooms 30)
    )
    (hotel
        (name "La rocca")
        (stars 4)
        (location "Firenze")
        (free_rooms 54)
    )
    (hotel 
        (name "Cammino Vecchio")
        (stars 3)
        (location "Saturnia")
        (free_rooms 14)
    )
    (hotel
        (name "Hotel Cristallo")
        (stars 5)
        (location "Saturnia")
        (free_rooms 5)
    )
    (hotel 
        (name "Augusta")
        (stars 3)
        (location "Perugia")
        (free_rooms 59)
    )
    (hotel
        (name "Borgo la chiaracia")
        (stars 2)
        (location "Perugia")
        (free_rooms 65)
    )
    (hotel 
        (name "Bosone Palace")
        (stars 4)
        (location "Assisi")
        (free_rooms 56)
    )
    (hotel
        (name "Hotel la meridiana")
        (stars 2)
        (location "Assisi")
        (free_rooms 73)
    )
    (hotel 
        (name "Grand Hotel Elite")
        (stars 5)
        (location "Ancona")
        (free_rooms 13)
    )
    (hotel
        (name "Rojan")
        (stars 1)
        (location "Ancona")
        (free_rooms 21)
    )
    (hotel 
        (name "Miramare")
        (stars 1)
        (location "Urbino")
        (free_rooms 45)
    )
    (hotel
        (name "Costaverde")
        (stars 2)
        (location "Urbino")
        (free_rooms 56)
    )
    (hotel 
        (name "Bucaneve")
        (stars 3)
        (location "Roma")
        (free_rooms 51)
    )
    (hotel
        (name "Hotel city")
        (stars 3)
        (location "Roma")
        (free_rooms 5)
    )
    (hotel 
        (name "Hotel Regent")
        (stars 3)
        (location "Rieti")
        (free_rooms 14)
    )
    (hotel
        (name "Hotel Ambasciatori")
        (stars 4)
        (location "Rieti")
        (free_rooms 24)
    )
    (hotel 
        (name "Hotel Mara")
        (stars 2)
        (location "L'Aquila")
        (free_rooms 65)
    )
    (hotel
        (name "Hotel Olimpya")
        (stars 4)
        (location "L'Aquila")
        (free_rooms 16)
    )
    (hotel 
        (name "Villa Nacarua")
        (stars 3)
        (location "Pescara")
        (free_rooms 35)
    )
    (hotel
        (name "Il tiglio")
        (stars 2)
        (location "Pescara")
        (free_rooms 24)
    )
    (hotel 
        (name "Nuovo Albergo")
        (stars 4)
        (location "Termoli")
        (free_rooms 51)
    )
    (hotel
        (name "Hotel Rio")
        (stars 2)
        (location "Termoli")
        (free_rooms 52)
    )
    (hotel 
        (name "Ambra Palace")
        (stars 5)
        (location "Campobasso")
        (free_rooms 5)
    )
    (hotel
        (name "Hotel Excelsio")
        (stars 4)
        (location "Campobasso")
        (free_rooms 8)
    )
    (hotel 
        (name "Hotel Prestige")
        (stars 3)
        (location "Napoli")
        (free_rooms 23)
    )
    (hotel
        (name "Hotel Ovidius")
        (stars 2)
        (location "Napoli")
        (free_rooms 59)
    )
    (hotel 
        (name "Dimora Intini")
        (stars 3)
        (location "Benevento")
        (free_rooms 62)
    )
    (hotel
        (name "Grande Albergo delle Nazioni")
        (stars 5)
        (location "Benevento")
        (free_rooms 8)
    )
    (hotel 
        (name "Hotel Vallerossa")
        (stars 3)
        (location "Brindisi")
        (free_rooms 24)
    )
    (hotel
        (name "Hotel Colonna")
        (stars 2)
        (location "Brindisi")
        (free_rooms 24)
    )
    (hotel 
        (name "Hotel Margherita")
        (stars 2)
        (location "Trami")
        (free_rooms 5)
    )
    (hotel
        (name "Hotel Leon")
        (stars 3)
        (location "Trami")
        (free_rooms 28)
    )
    (hotel 
        (name "Hotel Abete")
        (stars 3)
        (location "Matera")
        (free_rooms 12)
    )
    (hotel
        (name "Hotel Vittoria")
        (stars 4)
        (location "Matera")
        (free_rooms 29)
    )
    (hotel 
        (name "Hotel Parco delle Rose")
        (stars 3)
        (location "Potenza")
        (free_rooms 39)
    )
    (hotel
        (name "Hotel delle More")
        (stars 2)
        (location "Potenza")
        (free_rooms 28)
    )
    (hotel 
        (name "Al Pescatore Hotel")
        (stars 1)
        (location "Crotone")
        (free_rooms 24)
    )
    (hotel
        (name "Hotel Residence Nemo")
        (stars 3)
        (location "Crotone")
        (free_rooms 52)
    )
    (hotel 
        (name "Residence il barattolo")
        (stars 3)
        (location "Pizzo")
        (free_rooms 51)
    )
    (hotel
        (name "Hotel Solievo")
        (stars 4)
        (location "Pizzo")
        (free_rooms 56)
    )
    (hotel 
        (name "Hotel Mara")
        (stars 2)
        (location "Lipari")
        (free_rooms 64)
    )
    (hotel
        (name "Hotel Yria")
        (stars 1)
        (location "Lipari")
        (free_rooms 5)
    )
    (hotel 
        (name "Villa Barone")
        (stars 4)
        (location "Vulcano")
        (free_rooms 75)
    )
    (hotel
        (name "Villa Americana")
        (stars 1)
        (location "Vulcano")
        (free_rooms 98)
    )
    (hotel 
        (name "Imperiali Hotel")
        (stars 5)
        (location "Cagliari")
        (free_rooms 2)
    )
    (hotel
        (name "Hotel Hermitage")
        (stars 3)
        (location "Cagliari")
        (free_rooms 19)
    )
    (hotel 
        (name "KKUlt Hotel")
        (stars 2)
        (location "Caprera")
        (free_rooms 74)
    )
    (hotel
        (name "Holiday In")
        (stars 4)
        (location "Caprera")
        (free_rooms 2)
    )
)

(deffacts DATA::positions
    (position
        (name"Torino")
        (latitude 45.07340313)
        (longitude 7.53552315)
    )
    (position
        (name"Cherasco")
        (latitude 44.64496842)
        (longitude 7.85404244)
    )
    (position
        (name"Asti")
        (latitude 44.89685385)
        (longitude 8.13932732)
    )
    (position
        (name"Aosta")
        (latitude 45.74384075)
        (longitude 7.2806582)
    )
    (position
        (name"Genova")
        (latitude 44.44689209)
        (longitude 8.75074862)
    )
    (position
        (name"Imperia")
        (latitude 43.89345941)
        (longitude 7.94143818)
    )
    (position
        (name"Milano")
        (latitude 45.46264824)
        (longitude 9.03764891)
    )
	(position
		(name"Como")
		(latitude 45.8005143)
		(longitude 9.01538845)
	)
	(position
		(name"Bologna")
		(latitude 44.49903259)
		(longitude 11.19160202)
	)
	(position
		(name"Rimini")
		(latitude 44.05344196)
		(longitude 12.50464719)
	)
	(position
		(name"Venezia")
		(latitude 45.40420075)
		(longitude 12.10156086)
	)
	(position
		(name"Verona")
		(latitude 45.42622895)
		(longitude 10.92249153)
	)
	(position
		(name"Trento")
		(latitude 46.08044006)
		(longitude 11.05031596)
	)
	(position
		(name"Bolzano")
		(latitude 46.48923126)
		(longitude 11.31213831)
	)
	(position
		(name"Trieste")
		(latitude 45.65229875)
		(longitude 13.71362219)
	)
	(position
		(name"Gorizia")
		(latitude 45.94701735)
		(longitude 13.57459535)
	)
	(position
		(name"Firenze")
		(latitude 43.77993676)
		(longitude 11.17092808)
	)
	(position
		(name"Saturnia")
		(latitude 42.66515313)
		(longitude 11.50313477)
	)
	(position
		(name"Perugia")
		(latitude 43.09499704)
		(longitude 12.3102843)
	)
	(position
		(name"Assisi")
		(latitude 43.06577437)
		(longitude 12.60213641)
	)
	(position
		(name"Ancona")
		(latitude 43.58215027)
		(longitude 13.43678657)
	)
	(position
		(name"Urbino")
		(latitude 43.72923246)
		(longitude 12.61291067)
	)
	(position
		(name"Roma")
		(latitude 41.90973056)
		(longitude 12.2558141)
	)
	(position
		(name"Rieti")
		(latitude 42.41605097)
		(longitude 12.83052717)
	)
	(position
		(name"Pescara")
		(latitude 42.45554063)
		(longitude 14.13362508)
	)
	(position
		(name"Termoli")
		(latitude 41.98678343)
		(longitude 14.95989432)
	)
	(position
		(name"Campobasso")
		(latitude 41.55748809)
		(longitude 14.63300496)
	)
	(position
		(name"Napoli")
		(latitude 40.85352242)
		(longitude 14.10292292)
	)
	(position
		(name"Benevento")
		(latitude 41.12295525)
		(longitude 14.73767026)
	)
	(position
		(name"Brindisi")
		(latitude 40.64222486)
		(longitude 17.90099411)
	)
	(position
		(name"Trani")
		(latitude 41.27471439)
		(longitude 16.37387876)
	)
	(position
		(name"Matera")
		(latitude 40.66460121)
		(longitude 16.56510946)
	)
	(position
		(name"Potenza")
		(latitude 40.64122316)
		(longitude 15.77381011)
	)
	(position
		(name"Crotone")
		(latitude 39.07857626)
		(longitude 17.08057769)
	)
	(position
		(name"Pizzo")
		(latitude 38.7596846)
		(longitude 16.11933131)
	)
	(position
		(name"Lipari")
		(latitude 38.48107899)
		(longitude 14.90407054)
	)
	(position
		(name"Vulcano")
		(latitude 44.65442145)
		(longitude 7.7308176)
	)
	(position
		(name"Cagliari")
		(latitude 39.22538338)
		(longitude 9.05833803)
	)
	(position
		(name"Caprera")
		(latitude 41.2071823)
		(longitude 9.42613321)
	)
)