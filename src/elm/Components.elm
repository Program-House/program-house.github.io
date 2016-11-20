module Components exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)

header : Page -> Html Msg
header page =
  let
    pageStr =
      case page of
        Home -> "Home"
        About -> "About"
        Services -> "Services"
        Contact -> "Contact"
  in
  div 
  [ class "header-bar-container" ]
  [ div 
    [ class "header-bar" ] 
    [ headerButton pageStr "Home"
    , headerButton pageStr "About"
    , headerButton pageStr "Services" 
    , headerButton pageStr "Contact" 
    ]
  ]

headerButton : String -> String -> Html Msg
headerButton page str =
  let
    lit =
      if page /= str then ""
      else " lit"
  in
  p
  [ class ("button" ++ lit)
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

bigLinkButton : String -> String -> Html Msg
bigLinkButton label destination =
  a 
  [ class "button" 
  , style [ ("margin-left", "0px") ]
  , href destination
  ]
  [ text label ]

footer : Html Msg
footer =
  div 
  [ class "footer-buffer" ] 
  [ p
    [ class "footer-text" ]
    [ text "Ready to talk?" ]
  , p 
    [ class "button footer"
    , onClick (Navigate "Contact")
    ]
    [ text "Lets get in contact"]
  ]

setHeight : String -> Attribute Msg
setHeight str =
  style [ ("height", str) ]

point : String -> Html Msg
point str =
  p [ class "point small" ] [ text str ]

headerPoint : String -> Html Msg
headerPoint str =
  p [ class "point ignorable" ] [ text str ]

heightAndMargin : String -> String -> Attribute Msg
heightAndMargin height margin =
  style 
  [ ("height", height)
  , ("margin-top", margin)
  ]