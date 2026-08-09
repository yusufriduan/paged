package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type LoginRequest struct {
	UID      string `json:"uid"`
	Provider string `json:"provider"`
	ReturnUrl string `json:"returnUrl"`
}

type LoginResponse struct {
	Message string `json:"message"`
	Status  string `json:"status"`
	URL	 string `json:"url"`
}

func Login(w http.ResponseWriter, r *http.Request) {
	// login should query for user data from db with input of music provider id?
	fmt.Println("User logging in!")

	var req LoginRequest
	_ = json.NewDecoder(r.Body).Decode(&req)

	authURL := fmt.Sprintf("https://app.musicapi.com/paged/%s/auth?returnUrl=%s", req.Provider, req.ReturnUrl)

	// 2. Set response headers
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)

	// 3. Write JSON back to the client
	resp := LoginResponse{
		Message: fmt.Sprintf("User %s logged in successfully via %s", req.UID, req.Provider),
		Status:  "success",
		URL: authURL,
	}

	json.NewEncoder(w).Encode(resp)
}

func Logout(w http.ResponseWriter, r *http.Request) {
    fmt.Println("User logged out!")
}
