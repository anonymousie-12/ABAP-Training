CLASS zcl_04_abap_cds_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_04_abap_cds_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z00_CustomerWithTravels
      FIELDS FirstName, LastName, \_Travels-Description, \_Travels-BeginDate
      INTO TABLE @DATA(customers).

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
