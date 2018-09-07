module Mat4 exposing (main)

import AltMath.Matrix4 as AltMat4
import AltMath.Vector3 as AltVec3
import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Matrix4 as Mat4
import Math.Vector3 as Vec3


main : BenchmarkProgram
main =
    program suite


suite : Benchmark
suite =
    let
        a =
            Mat4.fromRecord altA

        b =
            Mat4.fromRecord altB

        altA =
            AltMat4.makePerspective 30 1.5 0 1000

        altB =
            AltMat4.makeLookAt { x = 1, y = 2, z = 3 } { x = 0, y = 0, z = 0 } { x = 0, y = 1, z = 0 }

        v =
            Vec3.fromRecord altV

        altV =
            AltVec3.vec3 1 2 3
    in
    describe "Mat4"
        [ Benchmark.compare "transform" "kernel" (\_ -> Mat4.transform a v) "elm" (\_ -> AltMat4.transform altA altV)
        , Benchmark.compare "inverse" "kernel" (\_ -> Mat4.inverse b) "elm" (\_ -> AltMat4.inverse altB)
        , Benchmark.compare "inverseOrthonormal" "kernel" (\_ -> Mat4.inverseOrthonormal b) "elm" (\_ -> AltMat4.inverseOrthonormal altB)
        , Benchmark.compare "mul" "kernel" (\_ -> Mat4.mul a b) "elm" (\_ -> AltMat4.mul altA altB)
        , Benchmark.compare "mulAffine" "kernel" (\_ -> Mat4.mulAffine a b) "elm" (\_ -> AltMat4.mulAffine altA altB)
        , Benchmark.compare "translate3" "kernel" (\_ -> Mat4.translate3 1 2 3 b) "elm" (\_ -> AltMat4.translate3 1 2 3 altB)
        , Benchmark.compare "transpose" "kernel" (\_ -> Mat4.transpose a) "elm" (\_ -> AltMat4.transpose altA)
        ]
