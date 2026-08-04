package main

import (
	"backend/db"
	"backend/functions/api/controllers"
	"context"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	chiadapter "github.com/awslabs/aws-lambda-go-api-proxy/chi"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

var chiLambda *chiadapter.ChiLambda

func init() {
	db.InitSupabase()

	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Use(middleware.Recoverer)

	r.Route("/api", func(r chi.Router) {
		r.Post("/login", controllers.Login)
		r.Post("/create_blend", controllers.CreateBlend)
		r.Get("/join_blend", controllers.JoinBlend)
		r.Post("/recalculate_blend", controllers.RecalculateBlend)
		r.Post("/create_jam", controllers.CreateJam)
		r.Post("/join_jam", controllers.JoinJam)
	})

	chiLambda = chiadapter.New(r)
}

func handler(ctx context.Context, req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	return chiLambda.ProxyWithContext(ctx, req)
}

func main() {
	lambda.Start(handler)
}
