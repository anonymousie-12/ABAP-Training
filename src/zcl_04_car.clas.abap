CLASS zcl_04_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_04_vehicle FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA seats TYPE i READ-ONLY.
    METHODS constructor
      IMPORTING
        make    TYPE string
        model   TYPE string
        seats   TYPE i.

      METHODS to_string REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_car IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).

    me->seats = seats.

  ENDMETHOD.


  METHOD to_string.

    string = | { super->to_string(  ) }, Seats: { seats }|.

  ENDMETHOD.

ENDCLASS.
