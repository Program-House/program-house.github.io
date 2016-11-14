module View exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import HomePage
import AboutPage
import Debug

view : Model -> Html Msg
view {page} =
  case page of
    Home -> HomePage.view

    About -> AboutPage.view

    _ -> HomePage.view
