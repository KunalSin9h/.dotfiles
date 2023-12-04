package main

import (
    "flag"
    "bufio"
    "os"
)

func main(){

}

func getScanner() *bufio.Scanner {
    var inputFile string

    flag.StringVar(&inputFile, "input", "input.txt", "The input file")
    flag.Parse()

    file, err := os.Open(inputFile)
    if err != nil {
        panic(err)
    }

    return bufio.NewScanner(file)
}
