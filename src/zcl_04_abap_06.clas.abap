CLASS zcl_04_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        out->write( zcl_04_helper=>get_travel_with_customer( travel_id = '002222' ) ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
