# Learnings
## 3/7
- `class_name` is how we can cast objects to a known type.
- The full inputevent handling docs are here:
    https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
- Input essentially works in reverse z-order (highest to lowest). Z-order
  is effectively controlled by the order things appear in the tree, in 
  reverse.
- If you wanted, in theory, to completely redo the input delegation system,
  at the top level, you could inject a node as the last element that captured
  the input.
