male(george).
male(philip).
male(charles).
male(andrew).
male(edward).
male(mark).
male(anthony).
male(timothy).
male(william).
male(harry).
male(peter).
male(steven).
male(david).

female(elizabeth).
female(elizabeth2).
female(margaret).
female(anne).
female(diana).
female(sophie).
female(louise).
female(sarah).
female(zara).
female(beatrice).
female(eugenie).

parent(george, elizabeth2).
parent(elizabeth, elizabeth2).
parent(george, margaret).
parent(elizabeth, margaret).
parent(philip, charles).
parent(elizabeth2, charles).
parent(philip, andrew).
parent(elizabeth2, andrew).
parent(philip, edward).
parent(elizabeth2, edward).
parent(philip, anne).
parent(elizabeth2, anne).
parent(charles, william).
parent(diana, william).
parent(charles, harry).
parent(diana, harry).
parent(mark, peter).
parent(anne, peter).
parent(edward, steven).
parent(sophie, steven).
parent(edward, louise).
parent(sophie, louise).
parent(mark, zara).
parent(anne, zara).
parent(andrew, beatrice).
parent(sarah, beatrice).
parent(andrew, eugenie).
parent(sarah, eugenie).

father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).

son(X,Y):- parent(X,Y),male(Y).
daughter(X,Y) :- parent(X,Y),female(Y).

child(X,Y):- son(X,Y);daughter(X,Y).

brother(X,Y) :- male(X),mother(Someone,X),mother(Someone,Y),X\=Y.
sister(X,Y) :- female(X),mother(Someone,X),mother(Someone,Y),X\=Y.

sibling(X,Y) :- brother(X,Y);sister(X,Y).

aunt(X,Y) :- sister(X,Z),parent(Z,Y).
uncle(X,Y) :- brother(X,Z),parent(Z,Y).

cousin(X,Y) :- (aunt(Z,X);uncle(Z,X)),parent(Z,Y),X\=Y.

grandfather(X,Y) :- male(Y),parent(X,Someone),parent(Someone,Y),X\=Y.
grandmother(X,Y) :- female(Y),parent(X,Someone),parent(Someone,Y),X\=Y.

grandparent(X,Y) :- grandfather(X,Y);grandmother(X,Y).

grandchild(X,Y) :- grandparent(Y,X).

nephew(X,Y) :- male(Y),(brother(X,Someone);sister(X,Someone)),parent(Someone,Y).

niece(X,Y) :- female(Y),(brother(X,Someone);sister(X,Someone)),parent(Someone,Y).
