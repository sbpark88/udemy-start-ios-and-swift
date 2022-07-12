struct Well {
    var watermark: Int

    mutating func someoneDrink(amount: Int) {
        watermark -= amount
    }
}
