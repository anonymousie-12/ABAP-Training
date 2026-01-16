CLASS zcl_04_main_verhicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_main_verhicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Deklaration
    DATA vehicle TYPE REF TO zcl_04_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_04_vehicle.
    DATA truck TYPE REF TO zcl_04_truck.

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



  ENDMETHOD.




ENDCLASS.

