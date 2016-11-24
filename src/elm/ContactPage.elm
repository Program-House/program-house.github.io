module ContactPage exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Components       exposing (..)


view : Model -> Html Msg
view {page} =
  div
  [ class "root" ]
  [ div 
    [ class "main-container" ]
    [ div 
      [ class "main" ]
      [ Components.header page
      , div
        [ class "body" ]
        [ titleBlock
        , bodyBlock
        , bigLinkButton "hello@programhouse.us" "mailto:hello@programhouse.us"
        , orbiterGame
        ]  
      ]
    ]
  ]

orbiterGame : Html Msg
orbiterGame =
  div
  [ heightAndMargin "auto" "150px" ]
  [ iframe
    [ class "orbiter-game"
    , src "http://www.chadtech.us/orbiter-13" 
    ]
    []
  ]

titleBlock : Html Msg
titleBlock =
  div 
  [ heightAndMargin "auto" "5px" ]
  [ p
    [ class "point ignorable" ]
    [ text "Get in touch" ] 
  ]

bodyBlock : Html Msg
bodyBlock =
  div 
  [ heightAndMargin "auto" "0px" ] 
  [ point "Program House looks forward to talking with you. We guarantee that we can help you out, even if thats just connecting you with the right people. You can reach out to us through the following email:"
  ]