module Main exposing (..)

import Browser
import Browser.Dom
import Colors.Opaque exposing (..)
import Element
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import Task



-- INIT


init : String -> ( Model, Cmd Msg )
init flags =
    ( { width = 0
      }
    , -- https://package.elm-lang.org/packages/elm/browser/latest/Browser.Dom
      Task.perform ViewportReceived
        (Task.andThen
            (\viewport -> Task.succeed { width = viewport.viewport.width, height = viewport.viewport.height })
            Browser.Dom.getViewport
        )
    )



-- MODEL


type alias Model =
    { width : Float
    }



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Stream Engine Studios"
    , body =
        [ Element.layout []
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
                    , Font.family [ Font.typeface "Open Sans", Font.sansSerif ]
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
                        , Element.width (Element.px (floor (model.width * 0.2))) -- `Element.width` needs an Int, so we need to convert Float to Int using `floor`
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
        ]
    }



-- UPDATE


type Msg
    = ViewportReceived { height : Float, width : Float }
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ViewportReceived viewport ->
            ( { model | width = viewport.width }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



-- MAIN


main : Program String Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
