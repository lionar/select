module Mdc.Select exposing (Data, Msgs, view)

{-| This library provides help with setting up a select box

# Helpers
@docs view
@docs Data
@docs Msgs

-}

import Html exposing (..)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)


{-|

-}
type alias Data item =
    { items : List item
    , opened : Bool
    , selected : item
    }


{-|

-}
type alias Msgs item msg =
    { close : msg
    , select : item -> msg
    , toggle : msg
    }


item : Data item -> Msgs item msg -> (item -> String) -> item ->  Html msg
item { selected } msgs toString val =
    li 
        [ selectedClass selected val
        , onClick <| msgs.select val 
        ] 
        [ text <| toString val ]


picker : Data item -> Msgs item msg -> (item -> String) -> Html msg
picker data msgs toString =
    ol [] <| List.map (item data msgs toString) data.items


selectedClass : item -> item -> Attribute msg
selectedClass selected val =
    if selected == val then
        class "selected"
    else
        class ""


value : Data item -> Msgs item msg -> Html msg
value { selected } msgs =
    span [ onClick msgs.toggle ] [ text <| Debug.toString selected ]


{-|

-}
view : Data item -> Msgs item msg -> (item -> String) -> Html msg
view ({ opened } as data) msgs toString =
    let nodes =
            if opened then
                div [] 
                    [ div [ class "backdrop", onClick msgs.close ] []
                    , picker data msgs toString
                    ]            
            else
                value data msgs

    in section [ class "select" ] [ nodes ]
