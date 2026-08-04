package controllers

import (
	"fmt"
	"net/http"
)

func Login(w http.ResponseWriter, r *http.Request) {
	// login should query for user data from db with input of music provider id?
	fmt.Println("User logging in!")
}
