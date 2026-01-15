CLASS zcl_04_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA customer_id TYPE /dmo/customer_id VALUE 19286.

  DATA first_name TYPE /dmo/first_name VALUE 'Bruce'.

  DATA last_name TYPE /dmo/last_name VALUE 'Wayne'.

  DATA city TYPE /dmo/city VALUE 'Gotham City'.

  DATA country_code TYPE land1 VALUE 'US'.



  out->write( condense( |{ customer_id ALPHA = OUT }| ) && ', ' && | | && |{ first_name } { last_name }, { city }, ({ country_code })| ).


  ENDMETHOD.
ENDCLASS.
