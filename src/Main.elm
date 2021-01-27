module Main exposing (..)

import Browser
import Element
import Html exposing (Html)



-- INIT


init : Model
init =
    {}



-- MODEL


type alias Model =
    {}



-- VIEW


view : Model -> Html Msg
view model =
    Element.layout
        []
        (Element.el [ Element.centerX, Element.centerY ] (Element.text "Hello, World!"))



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- MAIN


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
