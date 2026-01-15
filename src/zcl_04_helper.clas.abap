CLASS zcl_04_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    CLASS-METHODS get_travel_with_customer
      IMPORTING
                travel_id                   TYPE /dmo/travel_id

      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    "! <p class="shorttext synchronized" lang="en"></p>
    "!
    "! @parameter customer_id | <p class="shorttext synchronized" lang="en"></p>
    "! @parameter travels | <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS get_travels

      IMPORTING
                customer_id    TYPE /dmo/customer_id

      RETURNING VALUE(travels) TYPE z04_travels
      RAISING   zcx_abap_no_data.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_helper IMPLEMENTATION.

  METHOD get_travel_with_customer.




*    DATA(travel) = zcl_abap_helper=>get_travel( travel_id  ).
*    DATA(customer) = zcl_abap_helper=>get_customer( travel_with_customer-customer_id ).
*
*
*    travel_with_customer = CORRESPONDING #( travel ).
*    travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).





  ENDMETHOD.

  METHOD get_travels.

    DATA customer TYPE /dmo/customer.

   " travels = zcl_abap_helper=>get_travels( customer_id ).
    "handle exception

    SELECT FROM /dmo/customer
        FIELDS *
        WHERE customer_id = @customer_id
        INTO @customer.

    ENDSELECT.

  ENDMETHOD.

ENDCLASS.
