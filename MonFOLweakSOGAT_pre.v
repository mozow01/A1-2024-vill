Parameter Invar : Set.

Inductive Fm : Set :=
  | Tru : Fm
  | Fls : Fm
  | Imp : Fm -> Fm -> Fm
  | Cnj : Fm -> Fm -> Fm
  | Dis : Fm -> Fm -> Fm
  | Exi : Fm -> Fm
  | Uni : Fm -> Fm
  | Sub : Tm -> Fm -> Fm
with Tm : Set :=
  | InvarisTm : Invar -> Tm.

Parameter Pfvar : Fm -> Set.

Inductive Pf : Fm -> Set := 
 
  (*rules for propositional connectives*)

  (*truth*)
  | tt : Pf Tru
  | hyp : forall (A : Fm), (Pfvar A -> Pf A)
  
  (*false*)
  | exfalso : forall (A : Fm), (Pf Fls -> Pf A)
  

  (*implication*)
  | lam : forall (A B : Fm), (Pfvar A -> Pf B) -> Pf (Imp A B)
  | app : forall A B : Fm, (Pf (Imp A B)) -> Pf A -> Pf B
 
  (*conjunction*)
  | cnji : forall (A B : Fm), Pf A -> Pf B -> Pf (Cnj A B)
  | cnjel : forall A B : Fm, Pf (Cnj A B) -> Pf A
  | cnjer : forall A B : Fm, Pf (Cnj A B) -> Pf B

  (*disjunction*)
  | disil : forall A B : Fm, Pf A -> Pf (Dis A B)
  | disir : forall A B : Fm, Pf B -> Pf (Dis A B) 
  | dise : forall (A B C : Fm), Pf (Dis A B) -> (Pfvar A -> Pf C) -> (Pfvar B -> Pf C)-> Pf C

  (*rules for the existential quantifier*)
  | exii : forall (A : Fm) (t : Tm), Pf (Sub t A) -> Pf (Exi A)
  | exie : forall (A C : Fm), Pf (Exi A) -> (forall x : Invar, Pfvar (Sub (InvarisTm x) A) -> Pf C) -> Pf C

  (*rules for the universial quantifier*)
  | unii : forall (A : Fm), (forall x : Invar, Pf (Sub (InvarisTm x) A)) -> Pf (Uni A)
  | unie : forall (A : Fm), Pf (Uni A) -> (forall t : Tm, Pf (Sub t A))
  
  (*substitution is invariant with respect to the type formers*)
  | sub_imp_1 : forall (A B : Fm) (t : Tm), Pf (Sub t (Imp A B)) -> Pf (Imp (Sub t A) (Sub t B))
  | sub_imp_2 : forall (A B : Fm) (t : Tm), Pf (Imp (Sub t A) (Sub t B)) -> Pf (Sub t (Imp A B))

  | sub_cnj_1 : forall (A B : Fm) (t : Tm), Pf (Sub t (Cnj A B)) -> Pf (Cnj (Sub t A) (Sub t B))
  | sub_cnj_2 : forall (A B : Fm) (t : Tm), Pf (Cnj (Sub t A) (Sub t B)) -> Pf (Sub t (Cnj A B))

  | sub_dis_1 : forall (A B : Fm) (t : Tm), Pf (Sub t (Dis A B)) -> Pf (Dis (Sub t A) (Sub t B))
  | sub_dis_2 : forall (A B : Fm) (t : Tm), Pf (Dis (Sub t A) (Sub t B)) -> Pf (Sub t (Dis A B))

  (*Exi makes 0 variable formulas*)
  | sub_exi_1 : forall (A : Fm) (t : Tm), Pf (Sub t (Exi A)) -> Pf (Exi A)
  | sub_exi_2 : forall (A : Fm) (t : Tm), Pf (Exi A) -> Pf (Sub t (Exi A))

  (*Uni makes 0 variable formulas*)
  | sub_uni_1 : forall (A : Fm) (t : Tm), Pf (Sub t (Uni A)) -> Pf (Uni A)
  | sub_uni_2 : forall (A : Fm) (t : Tm), Pf (Uni A) -> Pf (Sub t (Uni A)). 

Infix "⊃" := Imp (at level 80, right associativity). 
Infix "∧" := Cnj (at level 80, right associativity).
Infix "∨" := Dis (at level 80, right associativity). 

Notation "⊤" := Tru (at level 80, no associativity). 
Notation "⊥" := Fls (at level 80, no associativity). 
Notation "∃" := Exi (at level 80, no associativity). 
Notation "∀" := Uni (at level 80, no associativity). 


Lemma quant_11 : forall A B, Pf (Exi (A ∧ B) ⊃ ((Exi A) ∧ (Exi B))).
Proof.
intros A B.
apply lam.
intros.
apply hyp in H.
apply cnji.
apply exie with (C:=Exi A) in H.
exact H.
intros x K.
apply hyp in K.
apply sub_cnj_1 in K.
apply cnjel in K.
apply exii with (t:=(InvarisTm x)).
exact K. 
apply exie with (C:=Exi B) in H.
exact H.
intros x K.
apply hyp in K.
apply sub_cnj_1 in K.
apply cnjer in K.
apply exii with (t:=(InvarisTm x)).
exact K. 
Qed.

Lemma quant_12 : forall A B, Pf (Uni (A ∧ B) ⊃ ((Uni A) ∧ (Uni B))).
Proof.
intros A B.
apply lam.
intros.
apply hyp in H.
apply cnji.
apply unii.
intros x.
apply unie with (t:=InvarisTm x) in H.
apply sub_cnj_1 in H.
apply cnjel in H.
exact H. 
apply unii.
intros x.
apply unie with (t:=InvarisTm x) in H.
apply sub_cnj_1 in H.
apply cnjer in H.
exact H. 
Show Proof.
Qed.

Eval compute in ((fun A B : Fm =>
 lam ((∀) (A ∧ B)) ((∀) A ∧ (∀) B)
   (fun H : Pfvar ((∀) (A ∧ B)) =>
    let H0 := hyp ((∀) (A ∧ B)) H in
    cnji ((∀) A) ((∀) B)
      (unii A
         (fun x : Invar =>
          let H1 :=
            unie (A ∧ B) H0 (InvarisTm x)
            in
          let H2 :=
            sub_cnj_1 A B (InvarisTm x)
              H1 in
          let H3 :=
            cnjel (Sub (InvarisTm x) A)
              (Sub (InvarisTm x) B) H2 in
          H3))
      (unii B
         (fun x : Invar =>
          let H1 :=
            unie (A ∧ B) H0 (InvarisTm x)
            in
          let H2 :=
            sub_cnj_1 A B (InvarisTm x)
              H1 in
          let H3 :=
            cnjer (Sub (InvarisTm x) A)
              (Sub (InvarisTm x) B) H2 in
          H3))))
).

Lemma quant_13 : forall A B, Pf (((Uni A) ∧ (Uni B)) ⊃ Uni (A ∧ B)).
Proof.
intros A B.
apply lam.
intros.
apply hyp in H.
apply unii.
intros x.
assert (H1 : Pf ((∀) A)).
apply cnjel in H.
exact H.
assert (H2 : Pf ((∀) B)).
apply cnjer in H.
exact H.
apply unie with (t:=InvarisTm x) in H1.
apply unie with (t:=InvarisTm x) in H2.
assert (K : Pf (Sub (InvarisTm x) A ∧ Sub (InvarisTm x) B)). 
apply (cnji (Sub (InvarisTm x) A) (Sub (InvarisTm x) B) H1 H2). 
apply sub_cnj_2 in K.
exact K. 
Qed.

Lemma quant_21 : forall A B, Pf (((Uni A) ∧ (Exi B)) ⊃ Uni (A ∧ (Exi B))).
Proof.
intros A B.
apply lam.
intros.
apply hyp in H.
apply unii.
intros x.
apply sub_cnj_2.
apply (cnji (Sub (InvarisTm x) A) (Sub (InvarisTm x) ((∃) B))).
assert (H1 : Pf ((∀) A)).
apply cnjel in H.
exact H.
assert (H2 : Pf ((∃) B)).
apply cnjer in H.
exact H.
apply unie with (t:=InvarisTm x) in H1.
exact H1. 
apply sub_exi_2.
apply cnjer in H.
exact H.
Qed.

Lemma problem_17 : forall (U : Set) (A B : U -> Prop) (H : exists x, A x /\ B x), (exists x, A x) /\ (exists x, B x).
Proof.
intros U A B H.
split.
all: induction H; exists x; intuition.
Show Proof.
Qed.

Eval simpl in ((fun (U : Set) (A B : U -> Prop)
   (H : exists x : U, A x /\ B x) =>
 conj
   (ex_ind
      (fun (x : U) (H0 : A x /\ B x) =>
       ex_intro (fun x0 : U => A x0) x
         (and_ind
            (fun (H1 : A x) (_ : B x) =>
             H1) H0)) H)
   (ex_ind
      (fun (x : U) (H0 : A x /\ B x) =>
       ex_intro (fun x0 : U => B x0) x
         (and_ind
            (fun (_ : A x) (H1 : B x) =>
     

        H1) H0)) H))
).

(*     = fun (U : Set) (A B : U -> Prop)
         (H : exists x : U, A x /\ B x)
       =>
       conj
         (ex_ind
            (fun (x : U)
               (H0 : A x /\ B x) =>
             ex_intro
               (fun x0 : U => A x0) x
               (and_ind
                  (fun (H1 : A x)
                     (_ : B x) => H1) H0))
            H)
         (ex_ind
            (fun (x : U)
               (H0 : A x /\ B x) =>
             ex_intro
               (fun x0 : U => B x0) x
               (and_ind
                  (fun (_ : A x)
                     (H1 : B x) => H1) H0))
            H)
     : forall (U : Set) (A B : U -> Prop),
       (exists x : U, A x /\ B x) ->
       (exists x0 : U, A x0) /\
       (exists x0 : U, B x0)
*)

Lemma problem_18 : forall (U : Set) (A B : U -> Prop) (H : (exists x, A x) /\ (exists x, B x)), (exists x, A x /\ (exists x, B x)).
Proof.
intros U A B H.
induction H as [H1 H2].
induction H1. exists x. intuition.
Show Proof.
Qed.

Eval simpl in (((fun (U : Set) (A B : U -> Prop)
   (H : (exists x : U, A x) /\
        (exists x : U, B x)) =>
 and_ind
   (fun (H1 : exists x : U, A x)
      (H2 : exists x : U, B x) =>
    ex_ind
      (fun (x : U) (H0 : A x) =>
       ex_intro
         (fun x0 : U =>
          A x0 /\ (exists x1 : U, B x1))
         x (conj H0 H2)) H1) H))).

Lemma problem_19 : forall (U : Set) (A B : U -> Prop) (H : (exists x, A x /\ (exists x, B x))) , (exists x, A x) /\ (exists x, B x) .
Proof.
intros U A B H.
split.
induction H. 
exists x.
intuition.
induction H. 
intuition.
Qed.
