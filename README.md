## Code for Journalism: Kleiner Selbstlernkurs für das Programmieren in R
Crash-Einführung in R, Übungen und Lösungen

Mit diesem Kurs können sich Journalist:innen selbst in das Coden mit der statistischen Programmiersprache R für journalistische Anwendungsfälle einarbeiten. Der Workshop besteht aus Cheatsheets, welche die wichtigsten Funktionen einführen, Aufgaben und Lösungsbeispielen mit Anmerkungen. 

## 1. R und RStudio installieren
Die statistische Programmiersprache R kann über die [Website des R Projects heruntergeladen und installiert werden](https://cran.uni-muenster.de/). RStudio ist eine integrierte Entwicklungsumgebung und bietet viele nützliche Tools, die das programmieren erleichtern: Ein Fenster für die Skripte (hier schreibst du deinen Code, quasi ein Word-Dokument für deine Programmiersprache), ein Fenster mit der Konsole (hier wird der Code an den Cmputer übergeben und ausgeführt), ein Fenster mit einer Übersicht aller vergebenen Variablen (zum Beispiel Namen und Infos zu eingelesenen Datensätzen) und ein Fenster mit Platz für die Hilfeseite oder auch Datenvisualisierungen. Schau dir das [Erklärvideo von RStudio](https://www.rstudio.com/products/rstudio/) dazu an. Herunterladen kannst du die kostenlose Version [hier](https://www.rstudio.com/products/rstudio/download/#download).

## 2. Erste Schritte in R
Der Workshop ist als .Rproj angelegt. Lade dir das Repo herunter und klicke doppelt auf das File **R_workshop.Rproj**. Sind R und RStudio auf deinem PC installiert, öffnet sich dadurch ein RStudio Fenster, dessen Working Directory der Workshop-Ordner ist. Du kannst nun über das Fenster unten rechts in RStudio die R-Skripte auswählen, die du öffnen möchtest. 

Wähle **basics_cheatsheet.R** aus. Dieses Skript zeigt dir die Grundvokabeln vom Programmieren in R. Schicke die Zeile Code, in der du dich aktuell befindest, an die Konsole, indem du zB auf den *Run*-Button in der Leiste über dem Skript klickst. 

Über das RStudio-Fenster unten rechts kannst du über den Reiter *Files* anschließend im Ordner *Übungen* nun **basics.R** auswählen und dich an den Übungen versuchen. Nutze das Cheatsheet als Hilfe, oder schau in **Lösungen/basics_loesungen.R**

## 3. Das Tidyverse
Das Tidyverse ist eine Sammlung mehrerer verwandter Funktionspakete (tidyr, dplyr, ggplot2...). Alle basieren auf der Philosophie, das es ein bestimmtes *tidy data format* gibt, in das man die Daten überführen sollte. Auf diesen [älteren Vortragsfolien](https://docs.google.com/presentation/d/1pbZGjy_rjb_0-vZ4x1YxqABf6WT7gv3nRFpuVGQk1e4/edit#slide=id.g91b1a85673_1_104) gibt es eine kleine theoretische Einführung dazu. 

Öffne das **tidyverse_cheatsheet.R** und lerne die wichtigsten Funktionen der tidyverse-Pakete kennen. Auch hier gibt es Übungen und Lösungen.

## 4. Hands On: Datenbereinigung, Analyse, Visualisierung
Im *Projekte*-Ordner gibt es weitere Übungen, Challenges und Exkursionen in R-Pakete. Such dir eines der Projekte aus, öffne die **.Rproj**-Datei und leg los! Die Projekte handeln sich an datenjournalistischen Anwendungsfällen entlang und helfen dir, die typischen Fallstricke und Aufgaben bei journalistischen Datenrecherchen zu üben. Dieser Ordner wird immer mal wieder um neue Projekte und Aufgaben ergänzt. 
