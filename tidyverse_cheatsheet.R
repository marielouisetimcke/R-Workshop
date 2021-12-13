## Hands on Tidyverse
# Erstmal installieren wir das tidyverse und magrittr
#install.packages(c("magrittr", "tidyverse"))
#library(tidyverse);library(magrittr)
#install.packages("needs");library(needs)
needs(magrittr, tidyverse)

# Dann sehen wir uns das pipen an
x <- 1:10

# Einfaches Beispiel: Berechnen einer Summe
sum(x)
x %>% sum()
x
x <- sum(x) # ganz normale Zuweisung und Funktionsbenutzung
x <- x %>% sum() # Normale Zuweisung und tidyverse Berechnung
x %<>% sum() # Die Zuweisungs-Pipe ist Pipe und Zuweisungs-Pfeil in einem


# Wir lesen wieder den Wahldatensatz von gestern ein
ew19 <- read.csv("Daten/ew19.csv", sep=";")

# Wir möchten ihn jetzt ins tidy / long format überführen. Ziel ist es, dass wir eine Spalte mit allen Parteinamen,
# und eine mit allen Stimmanzahlen haben. Alle anderen Spalten sollen bestehen bleiben.
# Wir benutzen den Befehl gather aus dem Paket tidyr dafür. 
# Er ist so aufgebaut:  gather(datensatz, 
#                              key = "Name der neuen Spalte mit den Parteinamen", 
#                              value = "Name der neuen Spalte mit den Stimmen, 
#                              Vektor mit Indizes der betreffenden Spalten)
gather(ew19, key = "Partei", value = "Stimmen", 8:47)
ew19 %>% gather(key = "Partei", value = "Stimmen", 8:47)

# Wir speichern den tidy Datensatz mal in einer neuen Variable
ew19_tidy <- ew19 %>% gather(key = "Partei", value = "Stimmen", 8:47)

# Nun einer kleiner Vergleich zwischen wide und long format:
# Wir möchten für jede Partei das prozentuale Ergebnis berechnen und es statt dem absoluten Wert in den Datensatz schreiben.
# Im wide data format schreiben wir dazu eine Schleife, die über jede Spalte mit den Parteien geht, die prozentualen Ergebnisse 
# berechnet und die Spalte dann überschreibt:

# wide format: Schleife
for(i in 8:47){
  ew19[i] <- 100*(ew19[i] / ew19$Gültige.Stimmen)
}
# Im tidyverse brauchen wir keine Schleife:
ew19_tidy %<>% mutate(Stimmen = 100*(Stimmen / Gültige.Stimmen))

# Das alles (und noch viel mehr) können wir auch ab dem Einlesen des Datensatzes in einer Kette machen:
ew19_tidy <- read.csv("Daten/ew19.csv", sep=";") %>% 
  gather(key="Partei", value="Stimmen", 8:47) %>% 
  mutate(Stimmen_rel = 100*(Stimmen / Gültige.Stimmen))

# Wenn wir keine Zuweisung machen, können wir nun ohne Überschreiben des Datensatzes alle möglichen Analysen
# und Berechnungen machen, die uns mehr über den Datensatz verraten. Dafür benutzen wir die dplyr-Funktionen:

# Wichtigste Funktionen von dplyr:
?filter() # den Datensatz nach Bedingungen filtern
?mutate() # Neue Spalten hinzufügen oder überschreiben
?summarize() # Zusammenfassen (nach Gruppen)
?group_by() # Datensatz gruppieren nach Spalten
?arrange() # Sortieren. Zusatz: desc()
?slice() # Nur die ersten X-Zeilen ausgeben (praktisch für Top-Liste)
?select() # Spalten auswählen 
?left_join() # Zwei Datensätze mergen

# Wo hatte die AfD ihr größtes Ergebnis?
#ew19_tidy[ew19_tidy$Partei == c("AfD", "CDU"),]
ew19_tidy %>% # Nimm Datensatz...
  filter(Partei %in% "AfD") %>% # filtere ihn auf die AfD
  arrange(desc(Stimmen_rel)) %>% # sortiere absteigend nach den Stimmenanteilen
  slice(1) %>% # nimm nur die erste Zeile
  select(Wahlgebiet_Name) # zeig mir nur den Namen

# Was war das Bundesergebnis je Partei?
ew19_tidy %>% 
  group_by(Partei) %>%
  summarize(result = 
      100*sum(Stimmen) / sum(Gültige.Stimmen)) %>%
  arrange(desc(result))

# In wie vielen Kreisen hatte die AfD ein Ergebnis 
# über ihrem Gesamtergebnis?
ew19_tidy %>% 
  filter(Partei %in% "AfD") %>% 
  filter(Stimmen_rel > 
           100*sum(Stimmen) / sum(Gültige.Stimmen)) %>%
  nrow()

# Was sind je Partei die drei Kreise mit dem höchsten 
# Ergebnis?
ew19_tidy %>% 
  group_by(Partei) %>% 
  arrange(desc(Stimmen_rel)) %>%
  slice(1:3) %>% 
  select(c(Partei, Wahlgebiet_Name, Stimmen_rel))


# Welche fünf Parteien haben je Bundesland das 
# niedrigste Ergebnis?
ew19_tidy %>% group_by(Wahlgebiet_Name3, Partei) %>%
  summarize(result = 
      100*sum(Stimmen) / sum(Gültige.Stimmen)) %>%
  arrange(result, .by_group=T) %>% slice(1:5)














