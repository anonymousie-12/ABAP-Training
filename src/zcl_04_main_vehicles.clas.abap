CLASS zcl_04_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Deklaration
    DATA vehicle TYPE REF TO zcl_04_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_04_vehicle.
    DATA truck TYPE REF TO zcl_04_truck.

    DATA rental TYPE REF TO zcl_04_rental.
    DATA carrier TYPE REF TO zcl_04_carrier.
    DATA partners TYPE TABLE OF REF TO zif_04_partner.

    "Instanziierungen
    vehicle = NEW zcl_04_car( make = 'Porsche' model = '911' seats = 5 ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    vehicle = NEW zcl_04_truck( make = 'MAN' model = 'TGX' cargo_in_tons = 40 ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    vehicle = NEW zcl_04_car( make = 'Skoda' model = 'Superb Combi' seats = 5 ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    rental = NEW #( ).
    carrier = NEW #( 'Lufthansa' ).

    APPEND rental TO partners.
    APPEND carrier TO partners.

    "Ausgabe
    LOOP AT vehicles INTO vehicle.

      TRY.

          vehicle->accelerate( 30 ).
          vehicle->accelerate( 10 ).
          vehicle->accelerate( 100 ).


        CATCH zcx_04_value_too_high INTO DATA(x).

          out->write( x->get_text(  ) ).

      ENDTRY.

      IF vehicle IS INSTANCE OF zcl_04_truck.
        truck = CAST #( vehicle ). " Downcast Truck truck = (Truck) verhicles

        truck->transform( ).

      ENDIF.

      out->write( vehicle->to_String(  ) ). " Dynamische Polymorphie
      out->write( |{ COND #( WHEN truck->is_transformed = 'X'
                       THEN 'Der LKW hat sich in einen Autobot transformiert        '
                       ELSE 'Der Autobot hast sich wieder in einen LKW transformiert' ) }| ).


    ENDLOOP.


    LOOP at partners into data(partner).

    out->write( partner->to_String( ) ).


    ENDLOOP.



  ENDMETHOD.




ENDCLASS.

