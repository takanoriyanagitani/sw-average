import Benchmark
import Foundation

import sw_average

let benchmarks = {

    Benchmark("Sum32f tiny") { benchmark in
        let vals: [Float32] = [3.776, 0.599]
        for _ in benchmark.scaledIterations {
            Benchmark.blackHole(sw_average.Sum32f(vals: vals))
        }
    }

    Benchmark("Sum32f small") { benchmark in
        let vals: [Float32] = [3.776, 0.599, 0.634, 0.333]
        for _ in benchmark.scaledIterations {
            Benchmark.blackHole(sw_average.Sum32f(vals: vals))
        }
    }

}
