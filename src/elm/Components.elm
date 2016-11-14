module Components exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)

header : Html Msg
header =
  div 
  [ class "header-bar-container" ]
  [ div [ class "header-bar" ] 
    [ headerButton "Home"
    , headerButton "About"
    , headerButton "Services" 
    , headerButton "Contact" 
    ]
  ]

headerButton : String -> Html Msg
headerButton str =
  p
  [ class "button" 
  , onClick (Navigate str)
  ]
  [ text str ]

linkButton : String -> String -> Html Msg
linkButton label destination =
  a 
  [ class "button small" 
  , href destination
  ]
  [ text label ]

setHeight : String -> Attribute Msg
setHeight str =
  style [ ("height", str) ]

point : String -> Html Msg
point str =
  p [ class "point small" ] [ text str ]

heightAndMargin : String -> String -> Attribute Msg
heightAndMargin height margin =
  style 
  [ ("height", height)
  , ("margin-top", margin)
  ]