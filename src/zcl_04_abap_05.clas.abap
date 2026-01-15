CLASS zcl_04_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_abap_05 IMPLEMENTATION.




  METHOD if_oo_adt_classrun~main.

    DATA customer TYPE z04_customer_info.

    customer-customer_id = '15'.


    TRY.

        out->write( ZCL_ABAP_HELPER=>get_CUSTOMER( customer_id = customer-customer_id ) ).



    CATCH zcx_abap_no_data.

        "handle exception
    ENDTRY.


    out->write( customer-customer_id ).










  ENDMETHOD.
ENDCLASS.
