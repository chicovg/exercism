// Package twofer contains a solution for the Two-Fer coding problem
package twofer

import "fmt"

// ShareWith given a name, return `One for (name), one for me.`.
// If a name is not given, return `One for you, one for me.`
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
