package db

import (
	"fmt"
	"log"
	"os"

	"github.com/lengzuo/supa"
)

// Global reference to the supa client instance
var Conf *supa.Client

func InitSupabase() {
	conf := supa.Config{
		ApiKey:     os.Getenv("SUPABASE_SECRET_KEY"),
		ProjectRef: os.Getenv("SUPABASE_URL"),
		Debug:      true,
	}

	var err error
	Conf, err = supa.New(conf)
	if err != nil {
		log.Fatalf("failed in init supa client: %v", err)
	}

	fmt.Println("Supabase client initialized successfully")
}