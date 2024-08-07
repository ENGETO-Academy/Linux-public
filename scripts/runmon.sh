#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);

my $animal_path = `which cowsay`;
chomp($animal_path);

if (!$animal_path) {
    die "cowsay is not installed. Please install cowsay to use this script.\n";
}

my $fortune = generate_fortune();
my $datetime = strftime "%Y-%m-%d-%H-%M-%S", localtime;
my $log_file = "/monitoring/runmon-$datetime.log";
open my $log, '>', $log_file or die "Couldn't open log file: $!";

print $log $fortune;
close $log;

open my $pipe, "| $animal_path -f bud-frogs > $log_file" or die "Couldn't open cowsay: $!";
print $pipe $fortune;
close $pipe;

sub generate_fortune {
    my @fortunes = (
        "První počítačový virus nazvaný 'Creeper' byl vytvořen v roce 1971 a zobrazoval zprávu 'I'M THE CREEPER: CATCH ME IF YOU CAN.'",
        "Ada Lovelace je považována za první programátorku na světě. V 19. století napsala algoritmus pro analytický stroj Charlese Babbage.",
        "Gordon Moore, spoluzakladatel Intelu, předpověděl, že počet tranzistorů na čipu se zdvojnásobí přibližně každé dva roky. Toto pozorování se nazývá Zákon Moorea.",
        "První doména, která byla registrována, byla 'symbolics.com' 15. března 1985.",
        "Technologie Wi-Fi byla původně vyvinuta pro použití v radarových systémech a byla komercializována až později.",
        "Systémy CAPTCHA, které se používají k rozlišení mezi člověkem a botem, jsou zkratkou pro 'Completely Automated Public Turing test to tell Computers and Humans Apart.'",
        "První e-mail byl odeslán v roce 1971 Rayem Tomlinsonem. Obsahoval náhodný řetězec znaků, který si sám nepamatuje.",
        "Před grafickými uživatelskými rozhraními (GUI) bylo běžné vytvářet obrázky pomocí textových znaků, což se nazývá ASCII art.",
        "První pevný disk od IBM, nazvaný IBM 350, byl představen v roce 1956 a měl kapacitu 5 MB.",
        "První počítačová myš byla vyvinuta v roce 1964 Dougem Engelbartem a byla vyrobena ze dřeva.",
        "Chybový kód 404, který se objevuje při neexistující webové stránce, znamená, že server nemůže najít požadovaný zdroj.",
        "Technologie Bluetooth byla pojmenována po dánském králi Haraldu I. 'Bluetooth' Gormssonovi, který proslul sjednocením Dánska a Norska.",
        "Napster, jeden z prvních populárních peer-to-peer sítí pro sdílení hudby, byl spuštěn v roce 1999 a uzavřen v roce 2001 kvůli právním problémům.",
        "První webová stránka byla vytvořena Timem Berners-Leem a byla zveřejněna 6. srpna 1991. Stále existuje na adrese http://info.cern.ch.",
        "Google původně používal své vlastní servery, které byly postaveny v dřevěných rámech, protože to bylo levnější než koupit hotové servery.",
        "Programovací jazyk C, vyvinutý Dennisem Ritchiem v Bell Labs v roce 1972, je jedním z nejvlivnějších programovacích jazyků a je základem pro mnoho moderních jazyků.",
        "Původní název programovacího jazyka Java byl 'Oak', pojmenovaný po dubu, který rostl před kanceláří vývojáře Jamese Goslinga.",
        "První operační systém s otevřeným zdrojovým kódem byl Linux, který byl vytvořen Linusem Torvaldsem v roce 1991.",
        "Termín 'spam' pro nevyžádané e-maily pochází z skeče Monty Pythona, kde se opakovaně zpívá 'spam, spam, spam.'",
        "QR kódy byly vyvinuty v Japonsku v roce 1994 pro sledování výrobních procesů automobilových dílů, ale nyní se používají široce pro mnoho různých účelů."
    );
    
    return $fortunes[int(rand(@fortunes))];
}
