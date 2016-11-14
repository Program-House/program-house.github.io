module Types exposing (..)

type Msg 
  = Navigate String

type Page 
  = Home
  | About
  | Services
  | Contact

type alias Model =
  { page  : Page }