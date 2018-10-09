// example from: https://docs.aws.amazon.com/lambda/latest/dg/go-programming-model-handler-types.html
package main

import (
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type myEvent struct {
	Name string `json:"What is your name?"`
	Age  int    `json:"How old are you?"`
}

type myResponse struct {
	Message string `json:"Answer:"`
}

func handleLambdaEvent(event myEvent) (myResponse, error) {
	return myResponse{Message: fmt.Sprintf("%s is %d years old!", event.Name, event.Age)}, nil
}

func main() {
	lambda.Start(handleLambdaEvent)
}
