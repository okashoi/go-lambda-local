package main

import "testing"

func TestHandleLambdaEvent(t *testing.T) {
	ev := myEvent{
		Name: "Jim",
		Age:  33,
	}

	res, err := handleLambdaEvent(ev)

	if err != nil {
		t.Fatal(err)
	}

	ex := "Jim is 33 years old!"
	if res.Message != ex {
		t.Fatalf("\nExpected: %s\nActual  : %s", ex, res.Message)
	}
}
