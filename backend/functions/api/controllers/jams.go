package controllers

import (
	"fmt"
	"net/http"
)

func CreateJam(w http.ResponseWriter, r *http.Request){
	// function to create a jam session
	fmt.Println("User creating jam session!")
}

func JoinJam(w http.ResponseWriter, r *http.Request){
	// function to join a jam session
	fmt.Println("User joining jam session!")
}