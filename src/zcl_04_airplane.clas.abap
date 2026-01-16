CLASS zcl_04_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor
      IMPORTING
                id                   TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_ABAP_INITIAL_PARAMETER,


        get_total_weight_in_tons
        RETURNING VALUE(total_weight_in_tons) TYPE i.



    DATA id TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_created_airplanes TYPE i READ-ONLY.


  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_04_airplane IMPLEMENTATION.

  METHOD constructor.


    if id is INITIAL.

       RAISE EXCEPTION new zcx_ABAP_INITIAL_PARAMETER( parameter = 'ID' ).



    elseif plane_type is INITIAL.

        RAISE EXCEPTION new zcx_ABAP_INITIAL_PARAMETER( parameter = 'Plane Type' ).



    elseif empty_weight_in_tons is INITIAL.


        RAISE EXCEPTION new zcx_ABAP_INITIAL_PARAMETER( parameter = 'Empty Weight' ).



    endif.

    me->id = id.

    me->plane_type = plane_type.


    me->empty_weight_in_tons = empty_weight_in_tons.
    number_of_created_airplanes += 1.


  ENDMETHOD.


  METHOD get_total_weight_in_tons.


    total_weight_in_tons = empty_weight_in_tons * '1.1'.


  ENDMETHOD.

ENDCLASS.
