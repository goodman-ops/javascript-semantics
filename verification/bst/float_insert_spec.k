require "../patterns/tree_float/js-verifier.k"

module BST-SPEC
imports JS-VERIFIER

rule
  <envs>...
    ENVS:Bag
    (.Bag => ?_:Bag)
  ...</envs>
  <objs>...
    (tree(O1)(T1:FloatTree) => tree(?O2)(?T2:FloatTree))
    OBJS:Bag
    (.Bag => ?_:Bag)
  ...</objs>
  <k>
    Call(
      // %var("insert"),
      @o(4),
      Undefined,
      @Cons(V:Float{exponent(11), significand(53)}, @Cons(O1:NullableObject, @Nil)))
  =>
    ?O2:NullableObject
  ...</k>
  requires bst(T1) andBool (notBool isNaN(V))
  ensures bst(?T2) andBool tree_keys(?T2) ==K { V } U tree_keys(T1)
endmodule

