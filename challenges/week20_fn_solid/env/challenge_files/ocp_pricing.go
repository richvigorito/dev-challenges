// file: pricing.go
package main

import (
	"fmt"
	"time"
)

type Shipment struct {
	WeightKg float64
	Zone     string // "Z1","Z2", ... now mgmt wants Z3..Z8 with special rules
	Day      time.Weekday
	IsRaining bool
}

func CalcPrice(s Shipment) float64 {
	base := s.WeightKg * 1.25
	switch s.Zone {
	case "Z1":
		// flat 5% off
		return base * 0.95
	case "Z2":
		// weekend surcharge 8%
		if s.Day == time.Saturday || s.Day == time.Sunday {
			return base * 1.08
		}
		return base
	// 🚨 New zones keep getting jammed in here:
	// case "Z5": 12% off if it's raining on Tuesday…
	// case "Z6": 3-tier discount table by weight…
	default:
		return base
	}
}

func main() {
	s := Shipment{WeightKg: 10, Zone: "Z2", Day: time.Saturday}
	fmt.Printf("Price: %.2f\n", CalcPrice(s))
}
