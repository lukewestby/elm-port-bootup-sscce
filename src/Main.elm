port module Main exposing (..)

import Html exposing (..)
import Html.App as Html


port whatever : (Int -> msg) -> Sub msg


type alias Model =
    Int


model : Model
model =
    0


type Msg
    = NewInt Int


update : Msg -> Model -> ( Model, Cmd Msg )
update (NewInt int) model =
    ( int, Cmd.none )


view : Model -> Html Msg
view int =
    div [] [ text <| toString int ]


subscriptions : Model -> Sub Msg
subscriptions model =
    whatever NewInt


main : Program Never
main =
    Html.program
        { view = view
        , init = ( model, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        }
