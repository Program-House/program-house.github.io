module AboutPage exposing (..)

import Html             exposing (..)
import Html.Attributes  exposing (..)
import Html.Events      exposing (..)
import Types            exposing (..)
import Components       exposing (..)

view : Page -> Html Msg
view page =
  div
  [ class "root" ]
  [ div 
    [ class "main-container" ]
    [ div 
      [ class "main" ]
      [ Components.header page
      , div
        [ class "body borders" ]
        [ titleBlock 
        , bodyBlock
        , whoBlock
        , chadtechBlock
        ]
      ]
    , Components.footer
    ]
  ]

chadtechBlock : Html Msg
chadtechBlock =
  div 
  [ class "chadtech-block" ] 
  [ div
    [ class "chadtech-links-container" ]
    [ p 
      [ class "chadtech-title" ]
      [ text "Chadtech" ]
    , linkButton "github" "https://www.github.com/Chadtech"
    , linkButton "personal site" "http://www.chadtech.us"
    ]
  , div
    [ class "chadtech-body" ]
    [ img 
      [ class "chadtech-pic"
      , src "./twitter-profile-pic.jpg" 
      ] 
      []
    , div 
      [ class "chadtech-text-container" ]
      [ point "Chadtech has been doing freelance software development for the last four years, working for various clients and with many different developers. Prior to doing software full time, he worked in the engineering department of the innovative consumer automobile manufacturer Local Motors. He earned his bachelor of science in Economics from the WP Carey school of business at ASU."]
    ]
  ]

whoBlock : Html Msg
whoBlock =
  div 
  [ heightAndMargin "auto" "25px" ]
  [ p
    [ class "point ignorable" ]
    [ text "The Team"]
  ]
 
bodyBlock : Html Msg
bodyBlock =
  div 
  [ heightAndMargin "auto" "0px" ] 
  [ point "Program House was formed in October of 2016 by Chad 'Chadtech' Stearns. It's members actively socialize with the larger software profession, regularly attend meet-ups and hackathons, and contribute to the open source community."
  ]

titleBlock : Html Msg
titleBlock =
  div 
  [ heightAndMargin "auto" "5px" ]
  [ p
    [ class "point ignorable" ]
    [ text "Program House" ] 
  ]



