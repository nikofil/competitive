(require '[clojure.string :as str])

(defn angle
  [x y]
  (if (and (zero? x) (zero? y))
    0
    (#(if (< x 0) (- (* 2 Math/PI) %) %)
      (Math/acos (/ y (Math/sqrt (+ (* x x) (* y y))))))
   ))

(defn solve
  [r x y]
  (and
    (>
      (* Math/PI 0.02 r)
      (angle x y))
    (<=
      (+ (* x x) (* y y))
      (* 50 50))))

(loop
  [i 1 n (read-string (read-line))]
  (if (> i n)
    ()
    (let
      [[r x y] (map read-string (str/split (read-line) #" "))]
      (printf "Case #%d: %s\n"
        i
        (if (solve r (- x 50) (- y 50))
          "black"
          "white"
          ))
    (recur (inc i) n))))
