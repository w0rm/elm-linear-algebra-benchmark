module Vec2 exposing (main)

import AltMath.Vector2 as AltVec2
import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Vector2 as Vec2


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    let
        a =
            Vec2.fromRecord altA

        b =
            Vec2.fromRecord altA

        altA =
            AltVec2.vec2 1 2

        altB =
            AltVec2.vec2 3 4
    in
    describe "Vec2"
        [ Benchmark.compare "getX" "kernel" (\_ -> Vec2.getX a) "elm" (\_ -> AltVec2.getX altA)
        , Benchmark.compare "setX" "kernel" (\_ -> Vec2.setX 10 a) "elm" (\_ -> AltVec2.setX 10 altA)
        , Benchmark.compare "add" "kernel" (\_ -> Vec2.add a b) "elm" (\_ -> AltVec2.add altA altB)
        , Benchmark.compare "sub" "kernel" (\_ -> Vec2.sub a b) "elm" (\_ -> AltVec2.sub altA altB)
        , Benchmark.compare "negate" "kernel" (\_ -> Vec2.negate a) "elm" (\_ -> AltVec2.negate altA)
        , Benchmark.compare "direction" "kernel" (\_ -> Vec2.direction a b) "elm" (\_ -> AltVec2.direction altA altB)
        , Benchmark.compare "length" "kernel" (\_ -> Vec2.length a) "elm" (\_ -> AltVec2.length altA)
        , Benchmark.compare "lengthSquared" "kernel" (\_ -> Vec2.lengthSquared a) "elm" (\_ -> AltVec2.lengthSquared altA)
        , Benchmark.compare "distance" "kernel" (\_ -> Vec2.distance a b) "elm" (\_ -> AltVec2.distance altA altB)
        , Benchmark.compare "normalize" "kernel" (\_ -> Vec2.normalize a) "elm" (\_ -> AltVec2.normalize altA)
        , Benchmark.compare "scale" "kernel" (\_ -> Vec2.scale pi a) "elm" (\_ -> AltVec2.scale pi altA)
        , Benchmark.compare "dot" "kernel" (\_ -> Vec2.dot a b) "elm" (\_ -> AltVec2.dot altA altB)
        ]
