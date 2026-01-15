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

    "Instanziierungen
    vehicle = NEW #( make = 'Porsche' model = '911' ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    vehicle = NEW #( make = 'MAN' model = 'TGX' ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    vehicle = NEW #( make = 'Skoda' model = 'Superb Combi' ).
    APPEND vehicle TO vehicles.
    out->write( zcl_04_vehicle=>number_of_created_vehicles ).

    "Ausgabe
    LOOP AT vehicles INTO vehicle.
      vehicle->accelerate( 30 ).
      vehicle->accelerate( 10 ).
      vehicle->accelerate( 100 ).


      out->write( |{ vehicle->make } { vehicle->model } { vehicle->speed_in_kmh }| ).


    ENDLOOP.



  ENDMETHOD.
ENDCLASS.

