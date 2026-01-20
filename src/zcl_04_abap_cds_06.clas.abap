CLASS zcl_04_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_cds_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  SELECT FROM Z04_CustomerKPIs( P_City = 'Heidelberg' )
  FIELDS *
  INTO TABLE @DATA(flights).

  SORT flights by totalrevenue DESCENDING.

  out->write( flights ).

  ENDMETHOD.

ENDCLASS.
