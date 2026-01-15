CLASS zcl_04_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_demo_01 IMPLEMENTATION.




  METHOD if_oo_adt_classrun~main.

    DATA text1 TYPE string.

    DATA text2 TYPE string.

    DATA age type i.

    DATA salary_in_euro TYPE p LENGTH 16 decimals 2.

    DATA first_name TYPE c LENGTH 40. " Zeichenketten fester Länge

    DATA matriculation_number type n length 7. " Ziffernfolge

    DATA flag. "X oder nichts

    DATA xmas TYPE d. "

    DATA noon TYPE t.

    DATA carrier_id TYPE c length 3. " ABAP Standardtyp

    DATA carrier_id2 TYPE /dmo/carrier_id. "systemweit verfügbar + geschenkte Metadaten = Datenelement


    text1  = 'Hello, kind World!'. " Deklaration

    text2 = 'Goodbye, cruel World!'.

    age = 44.

    salary_in_euro = '600.52'.

    first_name = 'Daniel'.

    matriculation_number = '123456'.

    xmas = '20261225'.

    noon = '120000'.

    flag = ''.

* Statische Vorbelegung

    DATA last_name TYPE c LENGTH 40 VALUE 'Jobin'.

* In-line Deklaration

    data(size_in_cm) = 158.


    out->write( text1 ). " Ausgabe


    out->write( text2 ). " Wertzuweisung

* mehr wird kommentiert


  ENDMETHOD.
ENDCLASS.
