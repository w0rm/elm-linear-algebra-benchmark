module Vec4 exposing (main)

import AltMath.Vector4 as AltVec4
import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Vector4 as Vec4


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    let
        a =
            Vec4.fromRecord altA

        b =
            Vec4.fromRecord altA

        altA =
            AltVec4.vec4 1 2 3 4

        altB =
            AltVec4.vec4 5 6 7 8
    in
    describe "Vec4"
        [ Benchmark.compare "getX" "kernel" (\_ -> Vec4.getX a) "elm" (\_ -> AltVec4.getX altA)
        , Benchmark.compare "setX" "kernel" (\_ -> Vec4.setX 10 a) "elm" (\_ -> AltVec4.setX 10 altA)
        , Benchmark.compare "add" "kernel" (\_ -> Vec4.add a b) "elm" (\_ -> AltVec4.add altA altB)
        , Benchmark.compare "sub" "kernel" (\_ -> Vec4.sub a b) "elm" (\_ -> AltVec4.sub altA altB)
        , Benchmark.compare "negate" "kernel" (\_ -> Vec4.negate a) "elm" (\_ -> AltVec4.negate altA)
        , Benchmark.compare "direction" "kernel" (\_ -> Vec4.direction a b) "elm" (\_ -> AltVec4.direction altA altB)
        , Benchmark.compare "length" "kernel" (\_ -> Vec4.length a) "elm" (\_ -> AltVec4.length altA)
        , Benchmark.compare "lengthSquared" "kernel" (\_ -> Vec4.lengthSquared a) "elm" (\_ -> AltVec4.lengthSquared altA)
        , Benchmark.compare "distance" "kernel" (\_ -> Vec4.distance a b) "elm" (\_ -> AltVec4.distance altA altB)
        , Benchmark.compare "normalize" "kernel" (\_ -> Vec4.normalize a) "elm" (\_ -> AltVec4.normalize altA)
        , Benchmark.compare "scale" "kernel" (\_ -> Vec4.scale pi a) "elm" (\_ -> AltVec4.scale pi altA)
        , Benchmark.compare "dot" "kernel" (\_ -> Vec4.dot a b) "elm" (\_ -> AltVec4.dot altA altB)
        ]
