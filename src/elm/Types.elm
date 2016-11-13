module Types exposing (..)

type Msg 
  = Navigate String

type alias Model =
  { page  : String }