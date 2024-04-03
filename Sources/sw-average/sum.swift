public func Sum32f(vals: [Float32]) -> Float32 {
    return vals.reduce(0.0, { state, next in state + next })
}

public func SumIf32f(vals: [Float32], filter: (Float32) -> Bool) -> Float32 {
    let filtered: [Float32] = vals.filter(filter)
    return Sum32f(vals: filtered)
}

public func SumBound32f(vals: [Float32], lbi: Float32, ube: Float32) -> Float32 {
    return SumIf32f(
        vals: vals,
        filter: { f in lbi <= f && f < ube }
    )
}
