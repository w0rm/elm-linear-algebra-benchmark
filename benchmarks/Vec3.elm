module Vec3 exposing (main)

import AltMath.Vector3 as AltVec3
import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Vector3 as Vec3


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    let
        a =
            Vec3.fromRecord altA

        b =
            Vec3.fromRecord altA

        altA =
            AltVec3.vec3 1 2 3

        altB =
            AltVec3.vec3 4 5 6
    in
    describe "Vec3"
        [ Benchmark.compare "getX" "kernel" (\_ -> Vec3.getX a) "elm" (\_ -> AltVec3.getX altA)
        , Benchmark.compare "setX" "kernel" (\_ -> Vec3.setX 10 a) "elm" (\_ -> AltVec3.setX 10 altA)
        , Benchmark.compare "add" "kernel" (\_ -> Vec3.add a b) "elm" (\_ -> AltVec3.add altA altB)
        , Benchmark.compare "sub" "kernel" (\_ -> Vec3.sub a b) "elm" (\_ -> AltVec3.sub altA altB)
        , Benchmark.compare "negate" "kernel" (\_ -> Vec3.negate a) "elm" (\_ -> AltVec3.negate altA)
        , Benchmark.compare "direction" "kernel" (\_ -> Vec3.direction a b) "elm" (\_ -> AltVec3.direction altA altB)
        , Benchmark.compare "length" "kernel" (\_ -> Vec3.length a) "elm" (\_ -> AltVec3.length altA)
        , Benchmark.compare "lengthSquared" "kernel" (\_ -> Vec3.lengthSquared a) "elm" (\_ -> AltVec3.lengthSquared altA)
        , Benchmark.compare "distance" "kernel" (\_ -> Vec3.distance a b) "elm" (\_ -> AltVec3.distance altA altB)
        , Benchmark.compare "normalize" "kernel" (\_ -> Vec3.normalize a) "elm" (\_ -> AltVec3.normalize altA)
        , Benchmark.compare "scale" "kernel" (\_ -> Vec3.scale pi a) "elm" (\_ -> AltVec3.scale pi altA)
        , Benchmark.compare "dot" "kernel" (\_ -> Vec3.dot a b) "elm" (\_ -> AltVec3.dot altA altB)
        , Benchmark.compare "cross" "kernel" (\_ -> Vec3.cross a b) "elm" (\_ -> AltVec3.cross altA altB)
        ]
