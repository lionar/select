module Main exposing (..)

import Browser
import Html exposing (..)
import Inco exposing (Code(..))
import Mdc.Select as Select


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { inco : Inco.Code
    , selecting : Bool
    }


init : Model
init =
    { inco = FCA
    , selecting = False
    }


type Msg
    = OnClose
    | OnSelect Inco.Code
    | OnToggle


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnClose ->
            { model | selecting = False }
        OnSelect inco ->
            { model | inco = inco, selecting = False }
        OnToggle ->
            { model | selecting = not model.selecting }


view : Model -> Html Msg
view { inco, selecting } =
    Select.view
        { items = Inco.list
        , opened = selecting
        , selected = inco
        }
        { close = OnClose
        , select = OnSelect
        , toggle = OnToggle
        }
