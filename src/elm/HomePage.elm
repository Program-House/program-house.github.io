module HomePage exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Components

view : Html Msg
view =
  div
  [ class "root" ]
  [ backgroundVideo
  , div 
    [ class "main-container" ]
    [ div 
      [ class "main" ]
      [ Components.header
      , div
        [ class "body" ]
        [ titleBlock
        , introBlock
        ]
      ]
    ]
  ]

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
      [ src "ph-nyc-video.mp4", type' "video/mp4" ] 
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
  div [ class "block" ]
  [ p [ class "point small" ] [ text "Program House is a software development consulting company. We make applications and websites- anything that runs on a computer and interacts with human beings. Software is our discipline and craft. We are professionals. We are conscious of design, human experience, but also good engineering."]]


