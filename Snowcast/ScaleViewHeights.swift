let scaleFactor: Float = 1.5

struct Heights {
    let newSnow: Float
    let baseDepth: Float
}

func * (heights: Heights, scale: Float) -> Heights {
    let scaledBaseDepth = heights.baseDepth * scale
    let scaledNewSnow = heights.newSnow * scale
    return Heights(newSnow: scaledNewSnow, baseDepth: scaledBaseDepth)
}
