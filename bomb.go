package main

import (
	"log"
	"net/http"

	"github.com/gobuffalo/packr/v2"
)

type httpHandler struct {
	Content []byte
}

func (h httpHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	w.Header().Set("Content-Encoding", "gzip")
	w.Write(h.Content)
}

func main() {
	box := packr.New("blob", "./content")
	bomb, err := box.Find("bomb.gz")
	if err != nil {
		log.Fatal(err)
	}
	http.ListenAndServe(":8080", httpHandler{Content: bomb})
}
