package main

import (
	"log"
	"net/http"

	"backend/db"
	"backend/functions/api/controllers"

	"github.com/go-chi/chi/v5"
	"github.com/joho/godotenv"
)

// this is for local testing only!!! PLEASE REMOVE DURING PRODUCTION

func main() {

	paths := []string{".env", "../../.env", "../../../.env"}

	for _, path := range paths {
		if err := godotenv.Load(path); err == nil {
			break
		}
	}

	log.Println("Warning: Could not locate .env file in any fallback paths. Relying on system environment variables.")

	db.InitSupabase()

	r := chi.NewRouter()

	r.Route("/api", func(r chi.Router) {
		r.Post("/login", controllers.Login)
		r.Post("/create_blend", controllers.CreateBlend)
		r.Get("/join_blend", controllers.JoinBlend)
		r.Post("/recalculate_blend", controllers.RecalculateBlend)
		r.Post("/create_jam", controllers.CreateJam)
		r.Post("/join_jam", controllers.JoinJam)
	})

	// start Standard Go HTTP Server on port 8080
	log.Println("local dev server running at http://localhost:8080")
	if err := http.ListenAndServe(":8080", r); err != nil {
		log.Fatalf("Server failed: %v", err)
	}
}
