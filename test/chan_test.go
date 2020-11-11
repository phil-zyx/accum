package test

import (
	"testing"
)

func Test_chan(t *testing.T) {
	ch := make(chan int)
	quit := make(chan int)

	go func() {
		for i := 0; i < 10; i++ {
			ch <- i
		}
		quit <- 0
	}()

	go func() {
		for {
			select {
			case r := <-ch:
				t.Log(r)
			case <-quit:
				break
			}
		}
	}()

	<-quit
}
