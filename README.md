# Implementation of DES protocol in Ada

This project has been realised as part of my first year of Master Degree in Caen University and supervised by Emmanuel Cagniot, Professor and Researcher at ENSICAEN.

Since the project is done, I won't be adding new major features (see section TO DO for more informations).

## License of the program

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Overview of the project

This project implements a sequential and parallel version of [DES](https://csrc.nist.gov/csrc/media/publications/fips/46/3/archive/1999-10-25/documents/fips46-3.pdf) (Data Encryption Standard) algorithm. The main goal of the project was to give me a taste of Ada and learn the basics of parallel programming by implementing a pipeline of tasks.

## Ressources needed for the project

To successfully compile and run the project, dowload the GNAT Community edition on Adacore.

### For Windows

* Go to Adacore and download GNAT Community  : https://www.adacore.com/download
* Let the installer lead you through the installation process.

### Other OS

**DISCLAIMER : I've never tried the installation process on another OS**

* Go to Adacore : https://www.adacore.com/download
* Click on "More packages, platforms, versions and sources"
* Chose the one corresponding to your OS

## Get the algorithm running

* Open the file des.gpr with GPS
* Choose the version of the algorithm you want to run by right-clicking the RUN button (mainSequential is the sequantiel version, mainParallel is the parallel version)
* Follow the console instructions : you'll have to enter a mode (D for deciphering, E for encryption), a source file (file to be encoded), a target file (source file encoded) and an 8-characters key.

## Additionnal informations

Feel free to email me : vadim.mika@hotmail.fr for any question you might have (on the project in general, DES or Ada), I'll try my best to answer ! You can also find additionnal informations in the *Rapport* repository (but everything is in French).

## TO DO

* Add test unit with GNATTest
* Add examples of execution
* Prettify the code/refactoring
