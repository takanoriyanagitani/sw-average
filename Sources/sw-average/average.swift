fileprivate func rcp32f(f: Float32) -> Float32? {
    if 0.0 == f {
        return nil
    }
    return 1.0 / f
}

public func Avg32f(vals: [Float32]) -> Float32? {
    let cnt: Int = vals.count
    let orcp: Float32? = rcp32f(f: Float32(cnt))
    return orcp.map{ rcp in
        let sum: Float32 = Sum32f(vals: vals)
        return rcp * sum
    }
}

public func AvgIf32f(vals: [Float32], filter: (Float32) -> Bool) -> Float32? {
    let filtered: [Float32] = vals.filter(filter)
    return Avg32f(vals: filtered)
}

public func AvgBound32f(vals: [Float32], lbi: Float32, ube: Float32) -> Float32? {
    return AvgIf32f(
        vals: vals,
        filter: { f in lbi <= f && f < ube }
    )
}
