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
  urlUpdate 
    model 
    { page =  Home, reglMount = "regl-mount" }

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of 

    Navigate to ->
      (model, Cmd.batch [ scrollToTop (), newUrl ("#/" ++ to)])


urlUpdate : Model -> Model -> (Model, Cmd Msg)
urlUpdate model' model =
  if model'.page == About then
    (model', mountRegl model.reglMount)
  else
    if model.page == About then
      (model', unmountRegl ())
    else
      (model', Cmd.none)


urlParser : Parser Model
urlParser =
  makeParser (fromUrl << .hash)


fromUrl : String -> Model
fromUrl url =
  let 
    page' =
      let length' = length url in
      case slice 2 (length') url of
        "Home" -> Home
        "About" -> About
        "Services" -> Services
        "Contact" -> Contact
        _ -> Home
  in
  { page =  page', reglMount = "regl-mount" }


toUrl : Model -> String
toUrl {page} =
  let
    page' =
      case page of
        Home -> "Home"
        About -> "About"
        Services -> "Services"
        Contact -> "Contact"
  in
  "#/" ++ page'

