// file: ocp_pricing.go
package main

import (
    "fmt"
    "time"
)

type Zone interface {
    Rate() float64
    ID() string
}

type BaseZone struct {
    id string
}

func (b BaseZone) ID() string {
    return b.id
}

type ZoneZ1 struct{ BaseZone }
func (z ZoneZ1) Rate() float64 { return 0.95 }

type ZoneZ2 struct{ BaseZone }
func (z ZoneZ2) Rate() float64 { return 1.08 }

type Shipment struct {
    WeightKg  float64
    Zone      Zone
    Day       time.Weekday
    IsRaining bool
}

func CalcPrice(s Shipment) float64 {
    base := s.WeightKg * 1.25
    rate := s.Zone.Rate()
    return base * rate
}

func main() {
    s := Shipment{
        WeightKg: 10,
        Zone:     ZoneZ2{BaseZone{"Z2"}},
        Day:      time.Saturday,
    }
    fmt.Printf("Price: %.2f\n", CalcPrice(s))
}
