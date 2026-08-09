package main

import (
	"log"
	"net/http"

	"backend/db"
	"backend/functions/api/controllers"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"
	"github.com/joho/godotenv"
)

// this is for local testing only!!! PLEASE REMOVE DURING PRODUCTION

func main() {
	envLoaded := false
	paths := []string{".env", "../../.env", "../../../.env"}

	for _, path := range paths {
		if err := godotenv.Load(path); err == nil {
			envLoaded = true
			log.Printf("Loaded .env file from: %s", path)
			break
		}
	}

	if !envLoaded {
		log.Println("Warning: Could not locate .env file in any fallback paths. Relying on system environment variables.")
	}

	db.InitSupabase()

	r := chi.NewRouter()

	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)

	r.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"https://*", "http://*"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           300,
	}))

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
