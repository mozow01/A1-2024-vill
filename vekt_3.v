Class LieAlg := Vek_mk {
  Vektor : Type;
  Skalar := nat; (*itt nat helyett reals kéne, de spórolunk*)

  (*összeadás*)
  add_v : Vektor -> Vektor -> Vektor;
  nul_v : Vektor;
  neg_v : Vektor -> Vektor;
  
  (*skalárral való szorzás*)
  mul_v : Skalar -> Vektor -> Vektor;

  (*vektoriális szorzás*)
  cross : Vektor -> Vektor -> Vektor;
  

  (*összeadás axiómák*)
  komm:           forall u v : Vektor, add_v u v = add_v v u;
  asszoc:         forall u v w : Vektor, add_v (add_v u v) w = add_v u (add_v
                  v w);
  null_vek:       forall u : Vektor, add_v nul_v u = u /\ add_v u nul_v = u;
  ellentett_vek:  forall u : Vektor, add_v (neg_v u) u = nul_v /\ add_v u 
                  (neg_v u) = nul_v;
  
  (*skalárral való szorzás axiómák*)
  vek_1 : forall (λ μ : Skalar) (u : Vektor), mul_v λ (mul_v μ u) = 
                                              mul_v (λ * μ) u ;
  vek_2 : forall u : Vektor, mul_v 1 u = u;
  
  (*skalárral való szorzás, összeadás vegyes axiómák*)
  vek_3 : forall (λ : Skalar) (u v : Vektor), mul_v λ (add_v u v) = 
                                              add_v (mul_v λ u) (mul_v λ v) ;
  vek_4 : forall (λ μ : Skalar) (u : Vektor), mul_v (λ + μ) u = 
                                              add_v (mul_v λ u) (mul_v μ u) ;
  (*vektoriális szorzás axiómák*)
  cross_1_add : forall (u v w : Vektor),
            cross (add_v u v) w =
            add_v (cross u w) (cross v w);
  cross_1_hom : forall (λ : Skalar) (u v : Vektor),
            cross (mul_v λ u) v =
            mul_v λ (cross u v);
  cross_2_add : forall (u v w : Vektor),
            cross w (add_v u v) =
            add_v (cross w u) (cross w v);
  cross_2_hom : forall (λ : Skalar) (u v : Vektor),
            cross u (mul_v λ v) =
            mul_v λ (cross u v);
  cross_alt : forall (u : Vektor),
            cross  u u = nul_v;
  cross_Jac : forall (u v w : Vektor),
            add_v (cross u (cross v w)) (add_v (cross v (cross w u)) (cross w (cross u v) ) ) = nul_v;

}.

Notation "u ⊕ v" := (add_v u v) (at level 90, left associativity) : type_scope.

Notation "λ ⊙ u" := (mul_v λ u) (at level 90, left associativity) : type_scope.

Notation "u × v" := (cross u v) (at level 90, left associativity) : type_scope.

Context (A : LieAlg).

Theorem beszorzás : forall (λ μ : Skalar) (u v : Vektor), ((λ + μ) ⊙ (u ⊕ v)) = ((λ ⊙ u) ⊕ (λ ⊙ v) ⊕ (μ ⊙ u) ⊕ (μ ⊙ v)).
Proof.
intuition.
rewrite vek_4.
rewrite vek_3.
rewrite -> vek_3.
rewrite asszoc.
rewrite -> asszoc.
rewrite asszoc.
auto.
Qed.
(*

Theorem Anticommutative : forall u v : Vektor, ((u × v) ⊕ (v × u)) = nul_v.
Proof.
intuition.
assert (H : ((u ⊕ v) × (u ⊕ v)) = nul_v ).
  { apply cross_alt. }
rewrite cross_1_add in H.
rewrite cross_2_add in H.
rewrite asszoc in H.
rewrite cross_2_add in H.
rewrite cross_alt in H.
rewrite null_vek with (u:=((u × v ⊕ (v × u ⊕ (v × v))))) in H.



Qed.
*)

  
        


