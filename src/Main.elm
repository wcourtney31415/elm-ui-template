module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { myNum : Int
    }


init : Model
init =
    { myNum = 42
    }


type Msg
    = Increment Model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment myModel ->
            myModel


view model =
    Element.layout
        []
    <|
        Element.column
            [ width fill
            , height fill
            ]
            [ Input.button
                [ centerX
                , centerY
                , Background.color <| rgb 0 1 0
                , padding 20
                ]
                { onPress = Maybe.Just <| Increment { model | myNum = model.myNum + 1 }
                , label = text <| String.fromInt model.myNum
                }
            ]
