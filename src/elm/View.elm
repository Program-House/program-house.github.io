module View exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)


text' : String
text' = "I <- Thats how it looks."

otherText : String
otherText = "Remove loose change from your pockets before addressing the jury. Grab all the free pens and pencils you can."

chadtech : String
chadtech = "HFNSSvector1, a new font by Chadtech"

view : Model -> Html Msg
view model =
  div
  [ class "root" ]
  [ backgroundVideo
  , div 
    [ class "main-container" ]
    [ div 
      [ class "main" ]
      [ header
        , div
        [ class "body" ]
        [ titleBlock 
        , aboutBlock
        ]
      ]
    ]
  ]

header : Html Msg
header =
  div 
  [ class "header-bar-container" ]
  [ div [ class "header-bar" ] 
    [ headerButton "Home" (Navigate "Home")
    , headerButton "About" (Navigate "About")
    , headerButton "Services" (Navigate "Services")
    , headerButton "Contact" (Navigate "Contact")
    ]
  ]

headerButton : String -> Msg -> Html Msg
headerButton str msg =
  p
  [ class "header-button" 
  , onClick msg
  ]
  [ text str ]


backgroundVideo : Html Msg
backgroundVideo =
  div
  [ class "background-video" ]
  [ video 
    [ autoplay True 
    , loop True
    , class "main-video"
    ] 
    [ source 
      [ src "subway-clip.ogv", type' "video/ogg" ] 
      [] 
    , source 
      [ src "subway-clip.mp4", type' "video/mp4" ] 
      []
    , text "Didnt work"
    ]
  ]

block : List (Html Msg) -> Html Msg
block =
  div [ class "block" ]


titleBlock : Html Msg
titleBlock =
  block
  [ p 
    [ class "point big blink" ] 
    [ text "Program House" ]
  , p
    [ class "point blink" ]
    [ text "By Chadtech" ] 
  ]

aboutBlock : Html Msg
aboutBlock =
  block
  [ p [ class "point small" ] [ text "Program House is a software development consulting company. We make applications and websites- anything that runs on a computer, and interacts with human beings. Software is our craft, and we are masters of it."]]


