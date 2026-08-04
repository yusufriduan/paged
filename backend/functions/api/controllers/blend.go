package controllers

import (
	"fmt"
	"net/http"
)

func CreateBlend(w http.ResponseWriter, r *http.Request) {
	// function to create blend playlist with all users in link
	fmt.Println("User creating blend playlist!")
}

func JoinBlend(w http.ResponseWriter, r *http.Request) {
	// function to join a playlist blend with link as input
	fmt.Println("User joining playlist blend!")
}

func RecalculateBlend(w http.ResponseWriter, r *http.Request) {
	// Every time new user joins blend recalculate the playlist
	fmt.Println("Recalculating playlist!")
}
