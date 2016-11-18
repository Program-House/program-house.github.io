module View exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import HomePage
import AboutPage
import ServicesPage
import ContactPage

view : Model -> Html Msg
view {page} =
  case page of
    Home -> 
      HomePage.view page

    About -> 
      AboutPage.view page

    Services -> 
      ServicesPage.view page

    Contact ->
      ContactPage.view page

