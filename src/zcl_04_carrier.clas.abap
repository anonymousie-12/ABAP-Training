CLASS zcl_04_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE z04_airplanes READ-ONLY.
    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_04_cargo_plane.

    METHODS constructor
      IMPORTING
        name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_04_airplane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_carrier IMPLEMENTATION.

  METHOD constructor.

    me->name = name.

  ENDMETHOD.

  METHOD add_airplane.

    APPEND airplane TO airplanes.


  ENDMETHOD.



  METHOD get_biggest_cargo_plane.

    DATA airplane TYPE REF TO zcl_04_airplane.

    DATA cargo_plane TYPE REF TO zcl_04_cargo_plane.

    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO airplane.



      IF airplane IS INSTANCE OF zcl_04_cargo_plane.
        cargo_plane = CAST #( airplane ).

        IF max_cargo_in_tons < cargo_plane->get_total_weight_in_tons(  ).

          max_cargo_in_tons = cargo_plane->get_total_weight_in_tons(  ).

          biggest_cargo_plane = cargo_plane.


        ENDIF.



      ENDIF.


    ENDLOOP.



  ENDMETHOD.

ENDCLASS.
