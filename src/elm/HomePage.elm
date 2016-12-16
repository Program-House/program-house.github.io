module HomePage exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Components       exposing (..)

view : Model -> Html Msg
view {page} =
  div
  [ class "root" ]
  [ backgroundVideo
  , div 
    [ class "main-container home" ]
    [ div 
      [ class "main" ]
      [ Components.header page
      , div
        [ class "body" ]
        [ titleBlock
        , introBlock
        ]
      ]
    , Components.footer
    ]
  ]

backgroundVideo : Html Msg
backgroundVideo =
  div
  [ class "background-video"

  ]
  [ video 
    [ autoplay True 
    , loop True
    , class "main-video"
    ] 
    [ source 
      [ src "ph-nyc-video.webm", type' "video/webm" ] 
      [] 
    ]
  ]

titleBlock : Html Msg
titleBlock =
  div [ class "block" ]
  [ p 
    [ class "point big outline blink" ] 
    [ text "Program House" ]
  , p
    [ class "point outline blink" ]
    [ text "By Chadtech" ] 
  ]

introBlock : Html Msg
introBlock =
  div [ heightAndMargin "auto" "100px" ]
  [ p [ class "point lil-small" ] [ text "Program House is a software development and consulting company. We make applications and websites for our clients. Software is our discipline and craft. We are professionals. We are conscious of the fact that the user experience is what matters in software, and that is what we engineer."]]


