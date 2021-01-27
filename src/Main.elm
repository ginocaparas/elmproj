module Main exposing (..)

import Browser
import Colors.Opaque exposing (..)
import Element
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
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
            , Element.alignTop
            , Element.width Element.fill
            , Element.height Element.fill
            , Background.color white
            ]
            [ Element.el
                [ Element.width Element.fill
                , Element.padding 10
                , Font.color white
                , Font.family
                    [ Font.typeface "Open Sans"
                    , Font.sansSerif
                    ]
                , Font.size 16
                , Background.color black
                ]
                (Element.text "Stream Engine Studios")
            , Element.wrappedRow
                [ Element.width Element.fill
                , Element.height Element.fill
                , Element.spacing 0
                , Border.solid
                , Border.color grey
                ]
                [ Element.column
                    [ Element.padding 10
                    , Element.alignTop
                    , Element.height Element.fill
                    , Border.width 1
                    , Border.color (Element.rgb255 177 177 177)
                    , Background.color (Element.rgba 0.7 0.7 0.7 0.5)
                    , Font.size 14
                    ]
                    [ Element.text "Home"
                    , Element.text "About"
                    , Element.text "Contact"
                    , Element.text "Lorem"
                    , Element.text "Ipsum"
                    ]
                , Element.el
                    [ Element.width Element.fill
                    , Element.height Element.fill
                    , Element.padding 10
                    , Border.color (Element.rgb255 177 177 177)
                    , Background.color white
                    ]
                    (Element.paragraph []
                        [ Element.text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ]
                    )
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
