
from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
    path('driver_insert',views.driver_insert,name="driver_insert"),
    path('driver_view',views.driver_view,name="driver_view"),
    path('driver_search/<str:driver_id>',views.driver_search,name="driver_search"),
    path('trip_insert',views.trip_insert,name="trip_insert"),
    path('bus_insert',views.bus_insert,name="bus_insert"),
    path('bus_delete/<str:bus_id>',views.bus_delete,name="bus_delete"),
    path('number_of_trip',views.number_of_trip,name="number_of_trip")
]
