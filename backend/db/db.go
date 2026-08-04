package db

import (
	"log"
	"os"
	"github.com/lengzuo/supa"
)

// One global reference to the supa client instance
var Conf *supa.ClientConf

func InitSupabase() {
	projectURL := os.Getenv("SUPABASE_URL")
	secretKey := os.Getenv("SUPABASE_SECRET_KEY")

	// Initialize
	var err error
	Conf, err = supa.Init(projectURL, secretKey)
	if err != nil {
		log.Fatalf("Failed to initialize supa client: %v", err)
	}
}