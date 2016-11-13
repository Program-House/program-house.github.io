import Html             exposing (p, text)
import Html.Attributes  exposing (class)
import Navigation       exposing (..)
import Types            exposing (..)
import Ports            exposing (..)
import View             exposing (view)
import String           exposing (slice, length)
import Debug

main =
  program urlParser
  { init          = init
  , view          = view
  , update        = update
  , urlUpdate     = urlUpdate
  , subscriptions = subscriptions
  }


init : Model  -> (Model, Cmd Msg)
init model =
  urlUpdate model (Model "Home")

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of 

    Navigate to ->
      (model, newUrl ("#/" ++ to))


urlUpdate : Model -> Model -> (Model, Cmd Msg)
urlUpdate model' model =
  (model', Cmd.none)


urlParser : Parser Model
urlParser =
  makeParser (fromUrl << .hash)


fromUrl : String -> Model
fromUrl url =
  Model (slice 2 (length url) url)


toUrl : Model -> String
toUrl {page} =
  "#/" ++ page

