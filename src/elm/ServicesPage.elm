module ServicesPage exposing (..)

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
        [ introBlock
        , servicesBlock
        , videoBlock
        ]
      ]
    , Components.footer  
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
      [ src "computer-stuff.webm", type' "video/webm" ]
      [] 
    ]
  ]

videoBlock : Html Msg
videoBlock =
  div
  [ heightAndMargin "auto" "15px" ]
  [ video 
    [ autoplay True 
    , loop True
    , class "services-video"
    ] 
    [ source 
      [ src "computer-stuff.webm", type' "video/webm" ] 
      [] 
    ]
  ]

introBlock : Html Msg
introBlock =
  div 
  [ heightAndMargin "auto" "15px" ]
  [ p
    [ class "point lil-big" ]
    [ text "Program House can help." ]
  --, point ""
  ]

servicesBlock : Html Msg
servicesBlock =
  div 
  [ heightAndMargin "auto" "15px" ]
  [ headerPoint "New Software Products"
  , point "We can take your idea and turn it into something real, that works just like how you picture it. We can start from zero, with just a description of what you want."
  , br [] []
  , headerPoint "Complicated Social Media Apps"
  , point "If your project needs users and messages and complicated interactions between them that's okay. Thats what we are good at."
  , br [] []
  , headerPoint "Existing Code"
  , point "You've already got an existing code base you need work on? No problem. We can pick up the project in whatever state it is in now."
  , br [] []
  , headerPoint "In-House Utilities"
  , point "Your business manages very particular documents in very particular ways, and Program House can make specialized utility software to handle your particular needs."
  , br [] []
  , headerPoint "Just a Website"
  , point "Dont need anything fancy? Thats okay. Putting together a simple website for your business is easy."
  , br [] [] 
  , headerPoint "Training and Consulting"
  , point "Maybe you don't even know what you need. Program House can give you advice, or teach your team the skills they need to move forward."
  , br [] []
  ] 



