;; clojure
(ns swap.core)

(defn swap-values [a b]
  [b a])

;; Run examples
(println "Swapped (1, 2):" (swap-values 1 2))
(println "Swapped (100, -50):" (swap-values 100 -50))

