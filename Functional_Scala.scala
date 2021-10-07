object Caesar {
    def main(args: Array[String]) {
        println(encrypt("This is a test string from Alan", 8))
        println(decrypt("BPQA QA I BMAB ABZQVO NZWU ITIV", 8))
        solve("HAL", 0, 26)
    }
    
    def shiftChar(c: Char, shift: Int): Char = {
        var ansNum: Int = c.toInt
        if (ansNum != ' '.toInt) {
            val temp2 = ansNum + (shift % 26)
            if (temp2 > 'Z'.toInt)
                ansNum = temp2 - 26
            else ansNum = temp2
        }
        return ansNum.toChar
    }
    
    def encrypt(text: String, shift: Int): String = {
        val msg = text.map(c => c.toUpper)
        return msg.map(c => shiftChar(c, shift))
    }
    
    def decrypt(text: String, shift: Int): String = {
        return encrypt(text, 26 - shift)
    }
    
    def solve (text: String, startVal: Int, maxVal: Int): Unit = {
        if (startVal <= maxVal){
            println("Caesar " + startVal + ": " + encrypt(text, startVal))
            solve(text, startVal+1, maxVal)
        }
    }
}
