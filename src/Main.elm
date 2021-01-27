module Main exposing (..)

import Browser
import Element
import Element.Border
import Html exposing (Html)



-- INIT


init : Model
init =
    {}



-- MODEL


type alias Model =
    {}



-- VIEW


{-| This is the layout of the page.

Take note of the basic elements such as `column`, `row`, `el` and `text`.

For `column` and `row`, they have a function signature as follows:

        Element.column [...attributes/styling of the column...] [...contents of the column...]

The structure of the page is that there is a column with two main elements: 1) the branding and 2) the content.

And the content is a `row` with two elements: the navigation and the empty box (hence Element.none).

-}
view : Model -> Html Msg
view model =
    Element.layout []
        (Element.column
            [ Element.centerX
            , Element.centerY
            , Element.spacing 10
            , Element.width (Element.px 1080)
            ]
            [ Element.el
                [ Element.width Element.fill
                , Element.padding 10
                , Element.Border.width 1
                ]
                (Element.text "Stream Engine Studios")
            , Element.row
                [ Element.width Element.fill
                , Element.spacing 10
                , Element.Border.solid
                , Element.Border.color (Element.rgb255 0 0 0)
                ]
                [ Element.column
                    [ Element.padding 10
                    , Element.spacing 10
                    , Element.Border.width 1
                    ]
                    [ Element.text "Home"
                    , Element.text "About"
                    , Element.text "Contact"
                    ]
                , Element.el
                    [ Element.width Element.fill
                    , Element.height Element.fill
                    , Element.padding 10
                    , Element.Border.width 1
                    ]
                    Element.none
                ]
            ]
        )



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
