import sw_average

let f: [Float32] = [1.0, 2.0]
let avg: Float32 = sw_average.Avg32f(vals: f) ?? 0.0

print("average: \( avg )")
