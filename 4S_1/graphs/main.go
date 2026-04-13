// main.go
package main

import (
	"image/color"
	"log"
	"math"

	"gonum.org/v1/plot"
	"gonum.org/v1/plot/plotter"
	"gonum.org/v1/plot/vg"
)

func main() {
	p := plot.New()
	p.Title.Text = "sin(x)"
	p.X.Label.Text = "x"
	p.Y.Label.Text = "sin(x)"

	n := 100
	pts := make(plotter.XYs, n)
	for i := 0; i < n; i++ {
		x := 2 * math.Pi * float64(i) / float64(n-1)
		pts[i].X = x
		pts[i].Y = math.Sin(x)
	}

	line, err := plotter.NewLine(pts)
	if err != nil {
		log.Fatal(err)
	}
	line.Color = color.RGBA{R: 255, A: 255}
	p.Add(line)

	if err := p.Save(6*vg.Inch, 4*vg.Inch, "sin.png"); err != nil {
		log.Fatal(err)
	}
}
