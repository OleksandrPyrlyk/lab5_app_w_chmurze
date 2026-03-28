# LAB 5 – Docker

## Opis
Aplikacja webowa uruchomiona w kontenerze Docker z wykorzystaniem nginx.

## Funkcjonalność
Strona wyświetla:
- adres IP serwera
- hostname
- wersję aplikacji

## Budowa obrazu
docker build --build-arg VERSION=1.0 -t lab5web .

## Uruchomienie
docker run -d -p 8080:80 --name lab5container lab5web

## Sprawdzenie działania kontenera i aplikacji
### <img width="1246" height="51" alt="image" src="https://github.com/user-attachments/assets/8e40f6d2-4b68-4b01-82e5-bb704e1e9049" />


## Sprawdzenie działania
curl http://localhost:8080
### <img width="193" height="150" alt="image" src="https://github.com/user-attachments/assets/74abcd6b-2b16-48eb-bd1e-c742688a6e6f" />

