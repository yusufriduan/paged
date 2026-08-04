package db

import (
	"fmt"
	"log"
	"os"
	

	supabase "github.com/lengzuo/supa"
)

// Global reference to the supa client instance
var Conf *supabase.Client

func InitSupabase() {
	conf := supabase.Config{
		ApiKey:     os.Getenv("SUPABASE_SECRET_KEY"),
		ProjectRef: os.Getenv("SUPABASE_URL"),
		Debug:      true,
	}

	var err error
	Conf, err = supabase.New(conf)
	if err != nil {
		log.Fatalf("failed in init supa client: %v", err)
	}

	fmt.Println("Supabase client initialized successfully")
}
