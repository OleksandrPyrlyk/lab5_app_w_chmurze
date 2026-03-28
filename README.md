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

## Sprawdzenie działania
curl http://localhost:8080
