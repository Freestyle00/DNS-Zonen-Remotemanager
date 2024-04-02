# DNS Zonenremotemanager

## Initiales Setup

Für dieses Playbook werden auf der lokalen Maschine folgende Packete benötigt:

- ansible
- knot

Nachdem die Packete installiert ist soll jetzt das ./gen-secrets.sh Script ausgeführt werden. Dies ist nötig um den initialen secrets.yml file zu generieren und um den TsigKey zu generieren der Nöttig ist damit die Server untereinander die Zone austauschen können.
Der WebhookSecret key muss selber erstellt werden und anschliesend bei GitHub angegeben werden damit die Webhooks funktionieren können.

Die IP addressen im inventory.yml müssen ebenfalls geändert werden auf die nöttigen Maschinen IP addressen.

## Das Playbook laufen lassen

Nachdem die Secrets generiert sind und die IP Addressen angepasst sind kann man nun das Playbook mit dem folgenden kommando laufen lassen:

```bash
ansible-playbook main.yml -i inventory.yml
```

Sollte alles richtig geklappt haben sind die Server eingerichtet und richtig konfiguriert um authoritativ in ihrer Zone zu antworten.

## Zonenupdates

Da die Zone jetzt online verfügbar ist ist es dementsprechend auch mäglich mithilfe des Webhooks neue Zonenupdates auszurollen.

Wichtig dabei ist es das die Zonenserial mit jeder änderung incrementiert werden muss. Die Serial selber ist in diesem Format aufgebaut:

JahrMonatTagVersion

Wen man am 02.04.2024 die erste änderung macht trägt man folgende Serial ein:

2024040201

Wen man dann festellt das weiter Änderungen nöttig sind inkrementiert man die version:

2024040202

Sollte man am nächsten Tag wieder eine Änderung machen wird die version auf 01 zurückgesetzt und das jetzige Datum gesetzt:

2024040301

Es ist auch möglich andere Formate zu nehmen wichtig ist das die Serial immer um 1 incrementiert wird. Sollte dies nicht geschehen erkennt der Nameserver nicht das es eine Änderung gab weswegen die änderungen nicht sichtbar werden.
