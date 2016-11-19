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
view model =
  case model.page of
    Home -> 
      HomePage.view model

    About -> 
      AboutPage.view model

    Services -> 
      ServicesPage.view model

    Contact ->
      ContactPage.view model

