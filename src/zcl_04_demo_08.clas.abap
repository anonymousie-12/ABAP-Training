CLASS zcl_04_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA carrier_id type /dmo/carrier_id.
    data connection_id type /dmo/connection_id value '0400'.
    data connections type table of /dmo/connection.

    " SELECT [Spalten] FROM [Datenbanktabelle] WHERE [Bedingung]

    "Lesen von Einzelsätzen

    DATA connection TYPE /dmo/connection.

    SELECT SINGLE FROM /dmo/connection
        FIELDS *
        WHERE carrier_id = @carrier_id AND connection_id = @connection_id
        INTO @connection.

    out->write( connection ).

    "Lesen mehrerer Datensätze
    SELECT FROM /dmo/connection
    FIELds *
    where carrier_id = @carrier_id
    INTO table @connections.

    out->write( connections ).

    "SELECT......ENDSELECT"

    SELECT FROM /dmo/connection
    FIELDS *
    WHERE carrier_id = @carrier_id
    INTO @connection.

    ENDSELECT.



  ENDMETHOD.

ENDCLASS.
