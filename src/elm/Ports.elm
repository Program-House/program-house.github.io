port module Ports exposing (..)

import Types exposing (..)

port mountRegl : String -> Cmd msg

port unmountRegl : () -> Cmd msg

port scrollToTop : () -> Cmd msg

--port request : String -> Cmd msg

--port response : (String -> msg) -> Sub msg