CLASS zcl_04_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA daten TYPE z04_travels.

    "daten = zcl_04_helper=>get_travels( '0440' ).

    "DELETE DATEN WHERE BEGIN_DATE < syst-datum.

    "DATA data2 TYPE REF TO z04_travels.
    "LOOP AT daten REFERENCE INTO data2.

      "data2->booking_fee = booking_fee * 1.1.


      " ENDLOOP.





    TRY.
        out->write( zcl_04_helper=>get_travels( '0440' ) ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.

  ENDMETHOD.



ENDCLASS.
